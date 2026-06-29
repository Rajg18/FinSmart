class ApiConstants {
  static const String baseUrl = 'http://localhost:8080/api/v1';

  // Auth
  static const String register = '/auth/register';
  static const String login = '/auth/login';
  static const String logout = '/auth/logout';
  static const String demo = '/auth/demo';

  // Transactions
  static const String transactions = '/transactions';

  // Budgets
  static const String budgets = '/budgets';

  // Goals
  static const String goals = '/goals';

  // Subscriptions
  static const String subscriptions = '/subscriptions';

  // Dashboard
  static const String dashboard = '/dashboard';
  static const String bankFeed = '/bank-feed/sync';

  // Analytics
  static const String analyticsCategory = '/analytics/category-breakdown';
  static const String analyticsMonthly = '/analytics/monthly-comparison';
  static const String analyticsTrend = '/analytics/spending-trend';
  static const String analyticsTopMerchants = '/analytics/top-merchants';

  // Batch
  static const String batchRun = '/batch/monthly-report/run';
}
