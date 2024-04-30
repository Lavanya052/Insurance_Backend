using System;
using System.Collections.Generic;

namespace UserData.Models;

public partial class Login
{
    public int UserId { get; set; }

    public string Username { get; set; } = null!;

    public string Password { get; set; } = null!;
}
public class LoginRequest
{
    public string Username { get; set; } = null!;

    public string Password { get; set; } = null!;

}