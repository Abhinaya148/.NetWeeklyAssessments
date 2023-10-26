using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using CPODetails.Data;
var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorPages();
builder.Services.AddDbContext<CPODetailsContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("CPODetailsContext") ?? throw new InvalidOperationException("Connection string 'CPODetailsContext' not found.")));

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapRazorPages();

app.Run();
