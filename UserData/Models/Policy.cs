using System;
using System.Collections.Generic;

namespace UserData.Models;

public partial class Policy
{
    public int PolicyId { get; set; }

    public string PolicyNumber { get; set; } = null!;

    public string PolicyType { get; set; } = null!;

    public string InsuranceCompany { get; set; } = null!;

    public DateTime StartDate { get; set; }

    public DateTime EndDate { get; set; }

    public decimal PremiumAmount { get; set; }
}
