import { GraduationCap } from "lucide-react";
import Link from "next/link";

export default function AuthLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <div className="min-h-screen flex flex-col">
      <header className="container mx-auto px-4 py-6">
        <Link href="/" className="flex items-center gap-2 w-fit">
          <GraduationCap className="h-8 w-8 text-primary" />
          <span className="text-xl font-bold">A/L Study Companion</span>
        </Link>
      </header>
      <main className="flex-1 flex items-center justify-center px-4 py-8">
        {children}
      </main>
      <footer className="container mx-auto px-4 py-4 text-center text-sm text-muted-foreground">
        For educational support only.
      </footer>
    </div>
  );
}
