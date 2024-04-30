using System;
using System.Collections.Generic;

namespace UserData.Models;

public partial class PaymentDetail
{
    public int PaymentDetailId { get; set; }

    public string CardOwnerName { get; set; } = null!;

    public string CardNumber { get; set; } = null!;

    public string ExpirationDate { get; set; } = null!;

    public string SecurityCode { get; set; } = null!;
}
