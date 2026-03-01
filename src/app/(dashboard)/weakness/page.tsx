import { createServerSupabaseClient } from "@/lib/supabase/server";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Progress } from "@/components/ui/progress";
import { WeaknessChart } from "@/components/dashboard/weakness-chart";
import { BarChart3, Target, TrendingUp, AlertTriangle } from "lucide-react";

export default async function WeaknessPage() {
  const supabase = await createServerSupabaseClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    return (
      <div className="text-center py-12">
        <p className="text-muted-foreground">Please log in to view your progress.</p>
      </div>
    );
  }

  // Fetch user weaknesses with topic details
  const { data: weaknesses } = await supabase
    .from("user_weaknesses")
    .select(`
      *,
      topics(name_en, name_si, subjects(code, name_en))
    `)
    .eq("user_id", user.id)
    .order("accuracy_percentage", { ascending: true });

  // Fetch recent attempts for stats
  const { data: recentAttempts } = await supabase
    .from("attempts")
    .select("*, questions(marks, question_type)")
    .eq("user_id", user.id)
    .order("attempted_at", { ascending: false })
    .limit(100);

  // Calculate overall stats
  const totalAttempts = recentAttempts?.length || 0;
  const correctAttempts = recentAttempts?.filter((a: { is_correct: boolean }) => a.is_correct).length || 0;
  const overallAccuracy = totalAttempts > 0 ? (correctAttempts / totalAttempts) * 100 : 0;

  // Group by subject
  const subjectStats: Record<string, { attempts: number; correct: number }> = {};
  recentAttempts?.forEach((attempt) => {
    const subjectCode = (attempt.questions as { question_type: string })?.question_type;
    if (!subjectStats[subjectCode]) {
      subjectStats[subjectCode] = { attempts: 0, correct: 0 };
    }
    subjectStats[subjectCode].attempts++;
    if (attempt.is_correct) {
      subjectStats[subjectCode].correct++;
    }
  });

  // Weak topics (below 60% accuracy)
  const weakTopics = weaknesses?.filter((w: { accuracy_percentage: number }) => w.accuracy_percentage < 60) || [];

  // Prepare chart data
  const chartData = weaknesses?.map((w) => ({
    topic: w.topics?.name_en || "Unknown",
    accuracy: w.accuracy_percentage,
    attempts: w.total_attempts,
  })) || [];

  return (
    <div className="space-y-8 page-transition">
      <div>
        <h1 className="text-3xl font-bold mb-2 flex items-center gap-3">
          <BarChart3 className="h-8 w-8 text-primary" />
          Progress & Weaknesses
        </h1>
        <p className="text-muted-foreground">
          Track your performance and identify areas for improvement
        </p>
      </div>

      {/* Overview Stats */}
      <div className="grid md:grid-cols-4 gap-4">
        <Card>
          <CardHeader className="pb-2">
            <CardDescription>Total Questions</CardDescription>
            <CardTitle className="text-3xl">{totalAttempts}</CardTitle>
          </CardHeader>
        </Card>
        <Card>
          <CardHeader className="pb-2">
            <CardDescription>Correct Answers</CardDescription>
            <CardTitle className="text-3xl text-green-600">{correctAttempts}</CardTitle>
          </CardHeader>
        </Card>
        <Card>
          <CardHeader className="pb-2">
            <CardDescription>Overall Accuracy</CardDescription>
            <CardTitle className="text-3xl">{overallAccuracy.toFixed(1)}%</CardTitle>
          </CardHeader>
        </Card>
        <Card>
          <CardHeader className="pb-2">
            <CardDescription>Weak Topics</CardDescription>
            <CardTitle className="text-3xl text-amber-600">{weakTopics.length}</CardTitle>
          </CardHeader>
        </Card>
      </div>

      {/* Weak Topics Alert */}
      {weakTopics.length > 0 && (
        <Card className="border-amber-200 bg-amber-50 dark:bg-amber-950 dark:border-amber-800">
          <CardHeader>
            <CardTitle className="flex items-center gap-2 text-amber-700 dark:text-amber-300">
              <AlertTriangle className="h-5 w-5" />
              Focus Areas
            </CardTitle>
            <CardDescription>
              These topics need more practice (below 60% accuracy)
            </CardDescription>
          </CardHeader>
          <CardContent>
            <div className="space-y-4">
              {weakTopics.slice(0, 5).map((w) => (
                <div key={w.id} className="space-y-2">
                  <div className="flex items-center justify-between">
                    <div>
                      <p className="font-medium">{w.topics?.name_en}</p>
                      <p className="text-xs text-muted-foreground">
                        {w.topics?.subjects?.name_en} • {w.total_attempts} attempts
                      </p>
                    </div>
                    <Badge
                      variant={
                        w.accuracy_percentage < 40 ? "destructive" : "warning"
                      }
                    >
                      {w.accuracy_percentage.toFixed(0)}%
                    </Badge>
                  </div>
                  <Progress
                    value={w.accuracy_percentage}
                    className="h-2"
                  />
                </div>
              ))}
            </div>
          </CardContent>
        </Card>
      )}

      {/* Performance Chart */}
      {chartData.length > 0 && (
        <Card>
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Target className="h-5 w-5" />
              Topic Performance
            </CardTitle>
            <CardDescription>
              Your accuracy across different topics
            </CardDescription>
          </CardHeader>
          <CardContent>
            <WeaknessChart data={chartData} />
          </CardContent>
        </Card>
      )}

      {/* All Topics */}
      <Card>
        <CardHeader>
          <CardTitle className="flex items-center gap-2">
            <TrendingUp className="h-5 w-5" />
            All Topics
          </CardTitle>
        </CardHeader>
        <CardContent>
          {weaknesses && weaknesses.length > 0 ? (
            <div className="space-y-4">
              {weaknesses.map((w) => (
                <div
                  key={w.id}
                  className="flex items-center justify-between p-3 rounded-lg bg-muted/50"
                >
                  <div>
                    <p className="font-medium">{w.topics?.name_en}</p>
                    <p className="text-sm text-muted-foreground sinhala-text">
                      {w.topics?.name_si}
                    </p>
                    <div className="flex items-center gap-2 mt-1">
                      <Badge variant="outline" className="text-xs">
                        {w.topics?.subjects?.name_en}
                      </Badge>
                      <span className="text-xs text-muted-foreground">
                        {w.total_attempts} attempts
                      </span>
                    </div>
                  </div>
                  <div className="text-right">
                    <p
                      className={`text-2xl font-bold ${
                        w.accuracy_percentage >= 80
                          ? "text-green-600"
                          : w.accuracy_percentage >= 60
                          ? "text-amber-600"
                          : "text-red-600"
                      }`}
                    >
                      {w.accuracy_percentage.toFixed(0)}%
                    </p>
                  </div>
                </div>
              ))}
            </div>
          ) : (
            <div className="text-center py-8 text-muted-foreground">
              <p>No data yet. Start practicing to see your progress!</p>
            </div>
          )}
        </CardContent>
      </Card>
    </div>
  );
}
