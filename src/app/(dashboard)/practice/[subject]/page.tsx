import Link from "next/link";
import { notFound } from "next/navigation";
import { createServerSupabaseClient } from "@/lib/supabase/server";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { ArrowLeft, FileText, Calendar } from "lucide-react";
import type { SubjectCode } from "@/types";

interface SubjectPageProps {
  params: Promise<{ subject: string }>;
}

export default async function SubjectPage({ params }: SubjectPageProps) {
  const { subject: subjectCode } = await params;
  const supabase = await createServerSupabaseClient();

  // Validate subject code
  const validSubjects: SubjectCode[] = ["combined_maths", "physics", "chemistry"];
  if (!validSubjects.includes(subjectCode as SubjectCode)) {
    notFound();
  }

  // Fetch subject details
  const { data: subject } = await supabase
    .from("subjects")
    .select("*")
    .eq("code", subjectCode)
    .single();

  if (!subject) {
    notFound();
  }

  // Fetch papers for this subject grouped by year
  const { data: papers } = await supabase
    .from("papers")
    .select("*")
    .eq("subject_id", subject.id)
    .order("year", { ascending: false });

  // Group papers by year
  type PaperType = { id: string; year: number; paper_type: string; total_marks: number; duration_minutes: number; description?: string };
  const papersByYear = papers?.reduce(
    (acc: Record<number, PaperType[]>, paper: PaperType) => {
      if (!acc[paper.year]) {
        acc[paper.year] = [];
      }
      acc[paper.year].push(paper);
      return acc;
    },
    {} as Record<number, PaperType[]>
  );

  const years = Object.keys(papersByYear || {})
    .map(Number)
    .sort((a, b) => b - a);

  return (
    <div className="space-y-6 page-transition">
      {/* Header */}
      <div className="flex items-center gap-4">
        <Link href="/practice">
          <Button variant="ghost" size="icon">
            <ArrowLeft className="h-5 w-5" />
          </Button>
        </Link>
        <div>
          <h1 className="text-3xl font-bold flex items-center gap-3">
            <span className="text-4xl">{subject.icon}</span>
            {subject.name_en}
          </h1>
          <p className="text-muted-foreground sinhala-text">{subject.name_si}</p>
        </div>
      </div>

      {/* Subject-specific info */}
      {subjectCode === "combined_maths" && (
        <Card className="bg-blue-50 dark:bg-blue-950 border-blue-200 dark:border-blue-800">
          <CardContent className="p-4">
            <p className="text-sm">
              <strong>Paper Structure:</strong> Each paper has Part A (10 × 25 marks)
              and Part B (5 of 7 × 150 marks). Total raw marks: 1000, scaled to 100.
            </p>
          </CardContent>
        </Card>
      )}

      {subjectCode === "physics" && (
        <Card className="bg-green-50 dark:bg-green-950 border-green-200 dark:border-green-800">
          <CardContent className="p-4">
            <p className="text-sm">
              <strong>Paper Structure:</strong> Paper I has 50 MCQs (1 mark each).
              Paper II has Part A (4 × 20 marks) and Part B (4 × 30 marks).
            </p>
          </CardContent>
        </Card>
      )}

      {subjectCode === "chemistry" && (
        <Card className="bg-orange-50 dark:bg-orange-950 border-orange-200 dark:border-orange-800">
          <CardContent className="p-4">
            <p className="text-sm">
              <strong>Paper Structure:</strong> Paper I has 50 MCQs. Paper II has
              Part A (4 × 100), Part B (2 of 3 × 150), Part C (2 of 3 × 150).
            </p>
          </CardContent>
        </Card>
      )}

      {/* Papers by Year */}
      <div>
        <h2 className="text-xl font-semibold mb-4 flex items-center gap-2">
          <Calendar className="h-5 w-5" />
          Past Papers by Year
        </h2>

        {years.length === 0 ? (
          <Card>
            <CardContent className="p-8 text-center">
              <p className="text-muted-foreground">
                No papers available yet. Check back later!
              </p>
            </CardContent>
          </Card>
        ) : (
          <div className="space-y-6">
            {years.map((year) => (
              <div key={year}>
                <h3 className="text-lg font-medium mb-3">{year}</h3>
                <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-4">
                  {papersByYear?.[year]?.map((paper: PaperType) => (
                    <Link
                      key={paper.id}
                      href={`/practice/${subjectCode}/${year}/${paper.paper_type}`}
                    >
                      <Card className="hover:shadow-md hover:border-primary/50 transition-all cursor-pointer h-full">
                        <CardHeader className="pb-2">
                          <CardTitle className="text-base flex items-center gap-2">
                            <FileText className="h-4 w-4" />
                            {paper.paper_type === "paper_1"
                              ? "Paper I"
                              : paper.paper_type === "paper_2"
                              ? "Paper II"
                              : "Paper III (Practical)"}
                          </CardTitle>
                        </CardHeader>
                        <CardContent>
                          <div className="flex items-center gap-2 mb-2">
                            <Badge variant="outline">
                              {paper.total_marks} marks
                            </Badge>
                            <Badge variant="secondary">
                              {paper.duration_minutes} min
                            </Badge>
                          </div>
                          <p className="text-sm text-muted-foreground">
                            {paper.description}
                          </p>
                        </CardContent>
                      </Card>
                    </Link>
                  ))}
                </div>
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  );
}
