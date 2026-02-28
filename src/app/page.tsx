import Link from "next/link";
import { Button } from "@/components/ui/button";
import {
  BookOpen,
  Brain,
  BarChart3,
  MessageSquare,
  Sparkles,
  GraduationCap,
} from "lucide-react";

export default function HomePage() {
  return (
    <div className="min-h-screen bg-gradient-to-b from-background to-muted">
      {/* Header */}
      <header className="container mx-auto px-4 py-6">
        <nav className="flex items-center justify-between">
          <div className="flex items-center gap-2">
            <GraduationCap className="h-8 w-8 text-primary" />
            <span className="text-xl font-bold">A/L Study Companion</span>
          </div>
          <div className="flex items-center gap-4">
            <Link href="/login">
              <Button variant="ghost">Login</Button>
            </Link>
            <Link href="/signup">
              <Button>Get Started</Button>
            </Link>
          </div>
        </nav>
      </header>

      {/* Hero Section */}
      <main className="container mx-auto px-4 py-16">
        <div className="text-center max-w-4xl mx-auto">
          <div className="inline-flex items-center gap-2 bg-primary/10 text-primary px-4 py-2 rounded-full text-sm font-medium mb-6">
            <Sparkles className="h-4 w-4" />
            AI-Powered Learning for A/L Success
          </div>
          <h1 className="text-4xl md:text-6xl font-bold mb-6 leading-tight">
            Master Your A/L Exams with{" "}
            <span className="text-primary">AI Explanations</span> in{" "}
            <span className="sinhala-text">සිංහල</span> & English
          </h1>
          <p className="text-xl text-muted-foreground mb-8 max-w-2xl mx-auto">
            Practice past papers from Combined Maths, Physics, and Chemistry.
            Get instant, marking-scheme aligned explanations from your personal
            AI tutor.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link href="/signup">
              <Button size="lg" className="text-lg px-8">
                Start Learning Free
              </Button>
            </Link>
            <Link href="#features">
              <Button size="lg" variant="outline" className="text-lg px-8">
                See Features
              </Button>
            </Link>
          </div>
        </div>

        {/* Subject Cards */}
        <div className="grid md:grid-cols-3 gap-6 mt-20">
          <SubjectCard
            title="Combined Maths"
            titleSi="සංයුක්ත ගණිතය"
            description="Paper I & II with Part A (25 marks) and Part B (150 marks) questions"
            color="maths"
            icon={<span className="text-2xl">∫</span>}
          />
          <SubjectCard
            title="Physics"
            titleSi="භෞතික විද්‍යාව"
            description="Paper I (50 MCQs) and Paper II (Part A & B structured)"
            color="physics"
            icon={<span className="text-2xl">⚛</span>}
          />
          <SubjectCard
            title="Chemistry"
            titleSi="රසායන විද්‍යාව"
            description="Paper I (MCQ), Paper II (Part A/B/C), and Practical guidance"
            color="chemistry"
            icon={<span className="text-2xl">🧪</span>}
          />
        </div>

        {/* Features Section */}
        <section id="features" className="mt-24">
          <h2 className="text-3xl font-bold text-center mb-12">
            Everything You Need to Excel
          </h2>
          <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-6">
            <FeatureCard
              icon={<BookOpen className="h-6 w-6" />}
              title="Past Paper Bank"
              description="10+ years of organized past papers with marking schemes"
            />
            <FeatureCard
              icon={<Brain className="h-6 w-6" />}
              title="AI Explanations"
              description="Step-by-step solutions in Sinhala or English, aligned with marking schemes"
            />
            <FeatureCard
              icon={<BarChart3 className="h-6 w-6" />}
              title="Weakness Tracking"
              description="Identify and focus on your weak topics with smart analytics"
            />
            <FeatureCard
              icon={<MessageSquare className="h-6 w-6" />}
              title="Ask AI"
              description="Get instant answers to any A/L question from your AI tutor"
            />
          </div>
        </section>

        {/* CTA Section */}
        <section className="mt-24 text-center bg-primary/5 rounded-2xl p-12">
          <h2 className="text-3xl font-bold mb-4">Ready to Boost Your Grades?</h2>
          <p className="text-muted-foreground mb-8 max-w-xl mx-auto">
            Join thousands of A/L students who are preparing smarter with
            AI-powered explanations.
          </p>
          <Link href="/signup">
            <Button size="lg" className="text-lg px-8">
              Start Your Free Trial
            </Button>
          </Link>
        </section>
      </main>

      {/* Footer */}
      <footer className="container mx-auto px-4 py-8 mt-16 border-t">
        <div className="flex flex-col md:flex-row justify-between items-center gap-4">
          <div className="flex items-center gap-2">
            <GraduationCap className="h-5 w-5 text-muted-foreground" />
            <span className="text-sm text-muted-foreground">
              A/L Study Companion © 2026
            </span>
          </div>
          <p className="text-sm text-muted-foreground">
            For educational support only. Past paper content belongs to
            respective examination authorities.
          </p>
        </div>
      </footer>
    </div>
  );
}

function SubjectCard({
  title,
  titleSi,
  description,
  color,
  icon,
}: {
  title: string;
  titleSi: string;
  description: string;
  color: string;
  icon: React.ReactNode;
}) {
  return (
    <div
      className={`p-6 rounded-xl border-2 bg-card hover:border-${color} transition-colors cursor-pointer group`}
    >
      <div
        className={`w-12 h-12 rounded-lg bg-${color}-light flex items-center justify-center mb-4 group-hover:scale-110 transition-transform`}
      >
        {icon}
      </div>
      <h3 className="text-xl font-semibold mb-1">{title}</h3>
      <p className="text-sm text-muted-foreground sinhala-text mb-2">{titleSi}</p>
      <p className="text-sm text-muted-foreground">{description}</p>
    </div>
  );
}

function FeatureCard({
  icon,
  title,
  description,
}: {
  icon: React.ReactNode;
  title: string;
  description: string;
}) {
  return (
    <div className="p-6 rounded-xl bg-card border hover:shadow-md transition-shadow">
      <div className="w-10 h-10 rounded-lg bg-primary/10 text-primary flex items-center justify-center mb-4">
        {icon}
      </div>
      <h3 className="font-semibold mb-2">{title}</h3>
      <p className="text-sm text-muted-foreground">{description}</p>
    </div>
  );
}
