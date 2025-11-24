export default function Home() {
  return (
    <div className="flex min-h-screen items-center justify-center bg-white">
      <main className="flex flex-col items-center justify-center text-center">
        <h1 className="text-4xl font-bold text-blue-600 mb-4">
          NisitTrade Web
        </h1>
        <p className="text-gray-600 text-lg">
          Next.js + Tailwind CSS
        </p>
        <div className="mt-8 p-6 bg-gray-50 rounded-lg shadow-md max-w-md">
          <h2 className="text-xl font-semibold mb-3">Features</h2>
          <ul className="text-left space-y-2 text-gray-700">
            <li>✅ Next.js with App Router</li>
            <li>✅ TypeScript Support</li>
            <li>✅ Tailwind CSS Styling</li>
            <li>✅ Monorepo Structure</li>
          </ul>
        </div>
      </main>
    </div>
  );
}
