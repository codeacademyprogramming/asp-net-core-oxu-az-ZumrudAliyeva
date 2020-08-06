using Microsoft.EntityFrameworkCore;
using oxu.news.Contexts;
using oxu.news.Interfaces;
using oxu.news.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace oxu.news.Repositories
{
    public class NewsRepository : INewsRepository
    {
        NewsContext _context;

        public NewsRepository(NewsContext context)
        {
            _context = context;
        }
        public void Create(News news)
        {

            _context.News.Add(news);
            _context.SaveChanges();
        }

        public void Delete(News news)
        {
            var _news = _context.News.FirstOrDefault(n => n.Id == news.Id);
            _news = news;

            _context.News.Remove(news);
            _context.SaveChanges();
        }

        public void Edit(News news)
        {
            _context.ChangeTracker.Entries().Where(e => e.Entity != null).ToList().ForEach(e => e.State = EntityState.Detached);
            _context.Entry(news).State = EntityState.Modified;
            _context.SaveChanges();
        }

        public List<News> GetAll()
        {
            return _context.News.ToList();
        }

        public News Get(int? id)
        {
           var news = _context.News.FirstOrDefault(n => n.Id == id);

            return news;
        }

        public void IncreaseLike(News news)
        {

            news.Like ++;

            _context.ChangeTracker.Entries().Where(e => e.Entity != null).ToList().ForEach(e => e.State = EntityState.Detached);
            _context.Entry(news).State = EntityState.Modified;
            _context.SaveChanges();
        }

        public void IncreaseDislike(News news)
        {

            news.Dislike ++;

            _context.ChangeTracker.Entries().Where(e => e.Entity != null).ToList().ForEach(e => e.State = EntityState.Detached);
            _context.Entry(news).State = EntityState.Modified;
            _context.SaveChanges();
        }

        public void IncreaseView(News news)
        {

            news.View ++;

            _context.ChangeTracker.Entries().Where(e => e.Entity != null).ToList().ForEach(e => e.State = EntityState.Detached);
            _context.Entry(news).State = EntityState.Modified;
            _context.SaveChanges();
        }
    }
}
