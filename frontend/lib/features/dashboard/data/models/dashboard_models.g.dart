// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionResponseImpl _$$TransactionResponseImplFromJson(
  Map<String, dynamic> json,
) => _$TransactionResponseImpl(
  id: (json['id'] as num).toInt(),
  merchant: json['merchant'] as String,
  amount: (json['amount'] as num).toDouble(),
  type: json['type'] as String,
  category: json['category'] as String,
  paymentMethod: json['paymentMethod'] as String?,
  source: json['source'] as String?,
  transactionDate: json['transactionDate'] as String,
  createdAt: json['createdAt'] as String,
);

Map<String, dynamic> _$$TransactionResponseImplToJson(
  _$TransactionResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'merchant': instance.merchant,
  'amount': instance.amount,
  'type': instance.type,
  'category': instance.category,
  'paymentMethod': instance.paymentMethod,
  'source': instance.source,
  'transactionDate': instance.transactionDate,
  'createdAt': instance.createdAt,
};

_$BudgetCardImpl _$$BudgetCardImplFromJson(Map<String, dynamic> json) =>
    _$BudgetCardImpl(
      category: json['category'] as String,
      limitAmount: (json['limitAmount'] as num).toDouble(),
      spentAmount: (json['spentAmount'] as num).toDouble(),
      percentageUsed: (json['percentageUsed'] as num).toDouble(),
    );

Map<String, dynamic> _$$BudgetCardImplToJson(_$BudgetCardImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'limitAmount': instance.limitAmount,
      'spentAmount': instance.spentAmount,
      'percentageUsed': instance.percentageUsed,
    };

_$GoalCardImpl _$$GoalCardImplFromJson(Map<String, dynamic> json) =>
    _$GoalCardImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      targetAmount: (json['targetAmount'] as num).toDouble(),
      savedAmount: (json['savedAmount'] as num).toDouble(),
      progressPercent: (json['progressPercent'] as num).toDouble(),
      requiredMonthly: (json['requiredMonthly'] as num).toDouble(),
      deadline: json['deadline'] as String?,
    );

Map<String, dynamic> _$$GoalCardImplToJson(_$GoalCardImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'targetAmount': instance.targetAmount,
      'savedAmount': instance.savedAmount,
      'progressPercent': instance.progressPercent,
      'requiredMonthly': instance.requiredMonthly,
      'deadline': instance.deadline,
    };

_$SubscriptionCardImpl _$$SubscriptionCardImplFromJson(
  Map<String, dynamic> json,
) => _$SubscriptionCardImpl(
  activeCount: (json['activeCount'] as num).toInt(),
  totalMonthlyBurden: (json['totalMonthlyBurden'] as num).toDouble(),
);

Map<String, dynamic> _$$SubscriptionCardImplToJson(
  _$SubscriptionCardImpl instance,
) => <String, dynamic>{
  'activeCount': instance.activeCount,
  'totalMonthlyBurden': instance.totalMonthlyBurden,
};

_$SalaryBannerImpl _$$SalaryBannerImplFromJson(Map<String, dynamic> json) =>
    _$SalaryBannerImpl(
      amount: (json['amount'] as num).toDouble(),
      merchant: json['merchant'] as String,
      creditedAt: json['creditedAt'] as String,
    );

Map<String, dynamic> _$$SalaryBannerImplToJson(_$SalaryBannerImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'merchant': instance.merchant,
      'creditedAt': instance.creditedAt,
    };

_$DashboardResponseImpl _$$DashboardResponseImplFromJson(
  Map<String, dynamic> json,
) => _$DashboardResponseImpl(
  currentBalance: (json['currentBalance'] as num).toDouble(),
  monthlyIncome: (json['monthlyIncome'] as num).toDouble(),
  monthlyExpenses: (json['monthlyExpenses'] as num).toDouble(),
  projectedMonthlyExpense: (json['projectedMonthlyExpense'] as num).toDouble(),
  recentTransactions: (json['recentTransactions'] as List<dynamic>)
      .map((e) => TransactionResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
  budgets: (json['budgets'] as List<dynamic>)
      .map((e) => BudgetCard.fromJson(e as Map<String, dynamic>))
      .toList(),
  goals: (json['goals'] as List<dynamic>)
      .map((e) => GoalCard.fromJson(e as Map<String, dynamic>))
      .toList(),
  subscriptions: SubscriptionCard.fromJson(
    json['subscriptions'] as Map<String, dynamic>,
  ),
  salaryBanner: json['salaryBanner'] == null
      ? null
      : SalaryBanner.fromJson(json['salaryBanner'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$DashboardResponseImplToJson(
  _$DashboardResponseImpl instance,
) => <String, dynamic>{
  'currentBalance': instance.currentBalance,
  'monthlyIncome': instance.monthlyIncome,
  'monthlyExpenses': instance.monthlyExpenses,
  'projectedMonthlyExpense': instance.projectedMonthlyExpense,
  'recentTransactions': instance.recentTransactions,
  'budgets': instance.budgets,
  'goals': instance.goals,
  'subscriptions': instance.subscriptions,
  'salaryBanner': instance.salaryBanner,
};

_$BankFeedResponseImpl _$$BankFeedResponseImplFromJson(
  Map<String, dynamic> json,
) => _$BankFeedResponseImpl(
  transactionsAdded: (json['transactionsAdded'] as num).toInt(),
  transactions: (json['transactions'] as List<dynamic>)
      .map((e) => TransactionResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
  syncedAt: json['syncedAt'] as String,
  nextSlotAvailableAt: json['nextSlotAvailableAt'] as String,
);

Map<String, dynamic> _$$BankFeedResponseImplToJson(
  _$BankFeedResponseImpl instance,
) => <String, dynamic>{
  'transactionsAdded': instance.transactionsAdded,
  'transactions': instance.transactions,
  'syncedAt': instance.syncedAt,
  'nextSlotAvailableAt': instance.nextSlotAvailableAt,
};
