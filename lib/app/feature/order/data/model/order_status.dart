enum OrderStatusState {
  UNPURCHASED,
  PENDING,
  SHIPPING,
  CONFIRMED,
  DELIVERED,
  FINISHED,
  CANCELLED;

  String get displayValue {
    switch (this) {
      case OrderStatusState.UNPURCHASED:
        return 'Chưa mua';
      case OrderStatusState.PENDING:
        return 'Đang chờ';
      case OrderStatusState.SHIPPING:
        return 'Đang giao';
      case OrderStatusState.CONFIRMED:
        return 'Đã xác nhận';
      case OrderStatusState.DELIVERED:
        return 'Đã giao';
      case OrderStatusState.FINISHED:
        return 'Đã hoàn thành';
      case OrderStatusState.CANCELLED:
        return 'Đã hủy';
      default:
        return '';
    }
  }
}
