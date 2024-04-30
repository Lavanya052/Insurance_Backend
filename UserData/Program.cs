using Microsoft.EntityFrameworkCore;
using UserData.Models;

var builder = WebApplication.CreateBuilder(args);


// Add services to the container.
var connectionString = builder.Configuration.GetConnectionString("InsurenceDB");
builder.Services.AddDbContextPool<InsuranceDbContext>(option =>
option.UseSqlServer(connectionString)
);

builder.Services.AddControllers(); 
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

app.UseCors(options =>options.WithOrigins("http://localhost:4200")

                            .AllowAnyMethod()

                            .AllowAnyHeader()

                            .SetIsOriginAllowed(origin => true)

                            .AllowCredentials());

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
