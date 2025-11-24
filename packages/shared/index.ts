// Shared utilities and types
export const APP_NAME = 'NisitTrade';
export const VERSION = '1.0.0';

// Example shared utility function
export function formatCurrency(amount: number): string {
  return new Intl.NumberFormat('th-TH', {
    style: 'currency',
    currency: 'THB',
  }).format(amount);
}

// Example shared type
export interface User {
  id: string;
  name: string;
  email: string;
}
