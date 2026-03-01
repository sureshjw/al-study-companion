import Link from "next/link";
import { createServerSupabaseClient } from "@/lib/supabase/server";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { ArrowRight, BookOpen, FileText } from "lucide-react";

export default async function PracticePage() {
  const supabase = await createServerSupabaseClient();

  // Fetch subjects with paper counts
  const { data: subjects } = await supabase
    .from("subjects")
    .select("*, papers(count)")
    .order("code");

  // Fetch recent papers
  const { data: recentPapers } = await supabase
    .from("papers")
    .select("*, subjects(*)")
    .order("year", { ascending: false })
    .limit(6);

  const subjectIcons: Record<string, string> = {
    combined_maths: "∫",
    physics: "⚛",
    chemistry: "🧪",
  };

  const subjectColors: Record<string, string> = {
    combined_maths: "border-blue-500 bg-blue-50 dark:bg-blue-950",
    physics: "border-green-500 bg-green-50 dark:bg-green-950",
    chemistry: "border-orange-500 bg-orange-50 dark:bg-orange-950",
  };

  return (
    <div className="space-y-8 page-transition">
      <div>
        <h1 className="text-3xl font-bold mb-2">Practice</h1>
        <p className="text-muted-foreground">
          Choose a subject to start practicing past paper questions
        </p>
      </div>

      {/* Subject Cards */}
      <div className="grid md:grid-cols-3 gap-6">
        {subjects?.map((subject: { id: string; code: string; name_en: string; name_si: string; papers?: { count: number }[] }) => (
          <Link
            key={subject.id}
            href={`/practice/${subject.code}`}
            className="group"
          >
            <Card
              className={`h-full transition-all hover:shadow-lg border-l-4 ${
                subjectColors[subject.code]
              }`}
            >
              <CardHeader>
                <div className="flex items-center justify-between">
                  <span className="text-4xl">{subjectIcons[subject.code]}</span>
                  <Badge variant="secondary">
                    {subject.papers?.[0]?.count || 0} papers
                  </Badge>
                </div>
                <CardTitle className="group-hover:text-primary transition-colors">
                  {subject.name_en}
                </CardTitle>
                <CardDescription className="sinhala-text">
                  {subject.name_si}
                </CardDescription>
              </CardHeader>
              <CardContent>
                <Button variant="ghost" className="p-0 h-auto">
                  Start Practice
                  <ArrowRight className="ml-2 h-4 w-4 group-hover:translate-x-1 transition-transform" />
                </Button>
              </CardContent>
            </Card>
          </Link>
        ))}
      </div>

      {/* Recent Papers Section */}
      <div>
        <h2 className="text-xl font-semibold mb-4 flex items-center gap-2">
          <FileText className="h-5 w-5" />
          Recent Papers
        </h2>
        <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-4">
          {recentPapers?.map((paper: { id: string; year: number; paper_type: string; total_marks: number; duration_minutes: number; subjects?: { code: string; name_en: string } }) => (
            <Link
              key={paper.id}
              href={`/practice/${paper.subjects?.code}/${paper.year}/${paper.paper_type}`}
            >
              <Card className="hover:shadow-md transition-shadow cursor-pointer">
                <CardContent className="p-4">
                  <div className="flex items-center justify-between mb-2">
                    <Badge
                      variant="outline"
                      className={`subject-badge ${paper.subjects?.code}`}
                    >
                      {paper.subjects?.name_en}
                    </Badge>
                    <span className="text-sm text-muted-foreground">
                      {paper.year}
                    </span>
                  </div>
                  <p className="font-medium">
                    {paper.paper_type === "paper_1"
                      ? "Paper I"
                      : paper.paper_type === "paper_2"
                      ? "Paper II"
                      : "Paper III"}
                  </p>
                  <p className="text-sm text-muted-foreground">
                    {paper.total_marks} marks • {paper.duration_minutes} min
                  </p>
                </CardContent>
              </Card>
            </Link>
          ))}
        </div>
      </div>

      {/* Quick Tips */}
      <Card className="bg-primary/5 border-primary/20">
        <CardContent className="p-6">
          <div className="flex items-start gap-4">
            <BookOpen className="h-8 w-8 text-primary flex-shrink-0" />
            <div>
              <h3 className="font-semibold mb-2">Practice Tips</h3>
              <ul className="text-sm text-muted-foreground space-y-1">
                <li>• Start with Part A questions to build confidence</li>
                <li>• Use the AI explanations to understand marking schemes</li>
                <li>• Review your weak topics in the Progress section</li>
                <li>• Practice under timed conditions using Quiz mode</li>
              </ul>
            </div>
          </div>
        </CardContent>
      </Card>
    </div>
  );
}
