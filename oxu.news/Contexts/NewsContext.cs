using Microsoft.EntityFrameworkCore;
using oxu.news.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace oxu.news.Contexts
{
    public class NewsContext : DbContext
    {
        public NewsContext(DbContextOptions<NewsContext> option) : base(option) { }
        public DbSet<News> News { get; set; }
    }
}
