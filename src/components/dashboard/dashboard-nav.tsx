"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import {
  BookOpen,
  Brain,
  BarChart3,
  MessageSquare,
  Home,
} from "lucide-react";
import { cn } from "@/lib/utils/cn";
import { Button } from "@/components/ui/button";

const navItems = [
  {
    title: "Dashboard",
    href: "/dashboard",
    icon: Home,
  },
  {
    title: "Practice",
    href: "/practice",
    icon: BookOpen,
  },
  {
    title: "Quiz",
    href: "/quiz",
    icon: Brain,
  },
  {
    title: "Progress",
    href: "/weakness",
    icon: BarChart3,
  },
  {
    title: "Ask AI",
    href: "/chat",
    icon: MessageSquare,
  },
];

export function DashboardNav() {
  const pathname = usePathname();

  return (
    <nav className="hidden md:flex w-64 flex-col border-r bg-muted/40 p-4 min-h-[calc(100vh-3.5rem)]">
      <div className="space-y-1">
        {navItems.map((item) => {
          const isActive =
            pathname === item.href || pathname.startsWith(`${item.href}/`);
          return (
            <Button
              key={item.href}
              variant={isActive ? "secondary" : "ghost"}
              className={cn(
                "w-full justify-start",
                isActive && "bg-secondary"
              )}
              asChild
            >
              <Link href={item.href}>
                <item.icon className="mr-2 h-4 w-4" />
                {item.title}
              </Link>
            </Button>
          );
        })}
      </div>

      {/* Subject Quick Links */}
      <div className="mt-8">
        <h3 className="px-3 text-xs font-semibold text-muted-foreground uppercase tracking-wider mb-2">
          Subjects
        </h3>
        <div className="space-y-1">
          <Button variant="ghost" className="w-full justify-start text-sm" asChild>
            <Link href="/practice/combined_maths">
              <span className="mr-2">∫</span>
              Combined Maths
            </Link>
          </Button>
          <Button variant="ghost" className="w-full justify-start text-sm" asChild>
            <Link href="/practice/physics">
              <span className="mr-2">⚛</span>
              Physics
            </Link>
          </Button>
          <Button variant="ghost" className="w-full justify-start text-sm" asChild>
            <Link href="/practice/chemistry">
              <span className="mr-2">🧪</span>
              Chemistry
            </Link>
          </Button>
        </div>
      </div>
    </nav>
  );
}
