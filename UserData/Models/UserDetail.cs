using System;
using System.Collections.Generic;

namespace UserData.Models;

public partial class UserDetail
{
    public int UserId { get; set; }

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string Email { get; set; } = null!;

    public string Phone { get; set; } = null!;

    public string Address { get; set; } = null!;

    public int PolicyId { get; set; }

    public virtual Policy Policy { get; set; } = null!;

    public virtual Login User { get; set; } = null!;
}
public class UserDetailWithPolicies
{
    public UserDetail? UserDetail { get; set; }
    public List<Policy>? RelatedPolicies { get; set; }
}