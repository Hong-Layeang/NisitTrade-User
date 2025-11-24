import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "NisitTrade - Web",
  description: "NisitTrade web application built with Next.js and Tailwind CSS",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body className="antialiased">
        {children}
      </body>
    </html>
  );
}
