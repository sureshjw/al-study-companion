"use client";

import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Progress } from "@/components/ui/progress";
import { CheckCircle2, XCircle, MinusCircle } from "lucide-react";

interface MarkingPoint {
  description: string;
  marks: number;
  awarded: boolean | "partial";
  feedback?: string;
}

interface MarkingBreakdownProps {
  totalMarks: number;
  obtainedMarks: number;
  breakdown: MarkingPoint[];
}

export function MarkingBreakdown({
  totalMarks,
  obtainedMarks,
  breakdown,
}: MarkingBreakdownProps) {
  const percentage = Math.round((obtainedMarks / totalMarks) * 100);

  return (
    <Card>
      <CardHeader className="pb-3">
        <CardTitle className="text-lg flex items-center justify-between">
          <span>Marking Breakdown</span>
          <span className="text-primary">
            {obtainedMarks}/{totalMarks} marks
          </span>
        </CardTitle>
      </CardHeader>
      <CardContent className="space-y-4">
        {/* Progress bar */}
        <div className="space-y-2">
          <Progress value={percentage} className="h-2" />
          <p className="text-sm text-muted-foreground text-center">
            {percentage}% achieved
          </p>
        </div>

        {/* Breakdown items */}
        <div className="space-y-3">
          {breakdown.map((item, index) => (
            <div
              key={index}
              className="flex items-start gap-3 p-3 rounded-lg bg-muted/50"
            >
              <div className="mt-0.5">
                {item.awarded === true ? (
                  <CheckCircle2 className="h-5 w-5 text-green-500" />
                ) : item.awarded === "partial" ? (
                  <MinusCircle className="h-5 w-5 text-amber-500" />
                ) : (
                  <XCircle className="h-5 w-5 text-red-500" />
                )}
              </div>
              <div className="flex-1">
                <div className="flex items-center justify-between">
                  <p className="text-sm font-medium">{item.description}</p>
                  <span className="text-sm text-muted-foreground">
                    {item.awarded === true
                      ? item.marks
                      : item.awarded === "partial"
                      ? Math.floor(item.marks / 2)
                      : 0}
                    /{item.marks}
                  </span>
                </div>
                {item.feedback && (
                  <p className="text-xs text-muted-foreground mt-1">
                    {item.feedback}
                  </p>
                )}
              </div>
            </div>
          ))}
        </div>
      </CardContent>
    </Card>
  );
}
