import Link from "next/link";
import { createServerSupabaseClient } from "@/lib/supabase/server";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Progress } from "@/components/ui/progress";
import {
  BookOpen,
  Brain,
  BarChart3,
  MessageSquare,
  Trophy,
  Target,
  Clock,
  TrendingUp,
} from "lucide-react";

export default async function DashboardPage() {
  const supabase = await createServerSupabaseClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    return null;
  }

  // Fetch user profile
  const { data: profile } = await supabase
    .from("profiles")
    .select("*")
    .eq("id", user.id)
    .single();

  // Fetch recent attempts
  const { data: recentAttempts } = await supabase
    .from("attempts")
    .select("*, questions(question_type, marks)")
    .eq("user_id", user.id)
    .order("attempted_at", { ascending: false })
    .limit(50);

  // Calculate stats
  const totalAttempts = recentAttempts?.length || 0;
  const correctAttempts = recentAttempts?.filter((a: { is_correct: boolean }) => a.is_correct).length || 0;
  const accuracy = totalAttempts > 0 ? (correctAttempts / totalAttempts) * 100 : 0;

  // Fetch weak topics
  const { data: weakTopics } = await supabase
    .from("user_weaknesses")
    .select("*, topics(name_en)")
    .eq("user_id", user.id)
    .lt("accuracy_percentage", 60)
    .order("accuracy_percentage")
    .limit(3);

  const greeting = () => {
    const hour = new Date().getHours();
    if (hour < 12) return "Good morning";
    if (hour < 18) return "Good afternoon";
    return "Good evening";
  };

  return (
    <div className="space-y-8 page-transition">
      {/* Welcome Section */}
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-3xl font-bold mb-1">
            {greeting()}, {profile?.name || "Student"}!
          </h1>
          <p className="text-muted-foreground">
            Ready to continue your A/L preparation?
          </p>
        </div>
        <Badge variant={profile?.subscription_status === "premium" ? "default" : "secondary"}>
          {profile?.subscription_status === "premium" ? "Premium" : "Free Plan"}
        </Badge>
      </div>

      {/* Quick Stats */}
      <div className="grid md:grid-cols-4 gap-4">
        <Card>
          <CardHeader className="flex flex-row items-center justify-between pb-2">
            <CardTitle className="text-sm font-medium">Questions Practiced</CardTitle>
            <Target className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">{totalAttempts}</div>
          </CardContent>
        </Card>
        <Card>
          <CardHeader className="flex flex-row items-center justify-between pb-2">
            <CardTitle className="text-sm font-medium">Accuracy</CardTitle>
            <TrendingUp className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">{accuracy.toFixed(1)}%</div>
            <Progress value={accuracy} className="mt-2 h-1" />
          </CardContent>
        </Card>
        <Card>
          <CardHeader className="flex flex-row items-center justify-between pb-2">
            <CardTitle className="text-sm font-medium">Correct Answers</CardTitle>
            <Trophy className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold text-green-600">{correctAttempts}</div>
          </CardContent>
        </Card>
        <Card>
          <CardHeader className="flex flex-row items-center justify-between pb-2">
            <CardTitle className="text-sm font-medium">Study Streak</CardTitle>
            <Clock className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">
              {totalAttempts > 0 ? "🔥 Active" : "Start today!"}
            </div>
          </CardContent>
        </Card>
      </div>

      {/* Quick Actions */}
      <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-4">
        <Link href="/practice">
          <Card className="hover:shadow-md transition-shadow cursor-pointer h-full">
            <CardContent className="p-6 flex flex-col items-center text-center">
              <BookOpen className="h-10 w-10 text-primary mb-3" />
              <h3 className="font-semibold">Practice</h3>
              <p className="text-sm text-muted-foreground">
                Solve past paper questions
              </p>
            </CardContent>
          </Card>
        </Link>
        <Link href="/quiz">
          <Card className="hover:shadow-md transition-shadow cursor-pointer h-full">
            <CardContent className="p-6 flex flex-col items-center text-center">
              <Brain className="h-10 w-10 text-primary mb-3" />
              <h3 className="font-semibold">Quiz</h3>
              <p className="text-sm text-muted-foreground">
                Test your knowledge
              </p>
            </CardContent>
          </Card>
        </Link>
        <Link href="/weakness">
          <Card className="hover:shadow-md transition-shadow cursor-pointer h-full">
            <CardContent className="p-6 flex flex-col items-center text-center">
              <BarChart3 className="h-10 w-10 text-primary mb-3" />
              <h3 className="font-semibold">Progress</h3>
              <p className="text-sm text-muted-foreground">
                Track your improvement
              </p>
            </CardContent>
          </Card>
        </Link>
        <Link href="/chat">
          <Card className="hover:shadow-md transition-shadow cursor-pointer h-full">
            <CardContent className="p-6 flex flex-col items-center text-center">
              <MessageSquare className="h-10 w-10 text-primary mb-3" />
              <h3 className="font-semibold">Ask AI</h3>
              <p className="text-sm text-muted-foreground">
                Get instant help
              </p>
            </CardContent>
          </Card>
        </Link>
      </div>

      {/* Focus Areas */}
      {weakTopics && weakTopics.length > 0 && (
        <Card className="border-amber-200 bg-amber-50 dark:bg-amber-950 dark:border-amber-800">
          <CardHeader>
            <CardTitle className="text-lg flex items-center gap-2">
              <Target className="h-5 w-5" />
              Focus Areas
            </CardTitle>
            <CardDescription>
              These topics need more practice
            </CardDescription>
          </CardHeader>
          <CardContent>
            <div className="space-y-3">
              {weakTopics.map((topic: { id: string; topics?: { name_en: string }; accuracy_percentage: number }) => (
                <div key={topic.id} className="flex items-center justify-between">
                  <span className="font-medium">{topic.topics?.name_en}</span>
                  <Badge variant="destructive">
                    {topic.accuracy_percentage.toFixed(0)}%
                  </Badge>
                </div>
              ))}
            </div>
            <Link href="/weakness">
              <Button variant="outline" className="w-full mt-4">
                View All Progress
              </Button>
            </Link>
          </CardContent>
        </Card>
      )}

      {/* Getting Started for New Users */}
      {totalAttempts === 0 && (
        <Card className="bg-primary/5 border-primary/20">
          <CardContent className="p-6">
            <h3 className="font-semibold text-lg mb-2">Getting Started</h3>
            <p className="text-muted-foreground mb-4">
              Welcome to A/L Study Companion! Here's how to make the most of your study time:
            </p>
            <ol className="list-decimal list-inside space-y-2 text-sm text-muted-foreground">
              <li>Start with Practice mode to solve past paper questions</li>
              <li>Get AI explanations in Sinhala or English</li>
              <li>Track your weak topics in the Progress section</li>
              <li>Use Quiz mode for timed practice sessions</li>
              <li>Ask the AI Tutor for help with any concept</li>
            </ol>
            <Link href="/practice">
              <Button className="mt-4">Start Practicing</Button>
            </Link>
          </CardContent>
        </Card>
      )}
    </div>
  );
}
