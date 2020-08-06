using oxu.news.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace oxu.news.Interfaces
{
    public interface INewsRepository
    {
        void Create(News news);
        void Delete(News news);
        List<News> GetAll();
        News Get(int? id);
        void Edit(News news);
        void IncreaseLike(News news);
        void IncreaseDislike(News news);
        void IncreaseView(News news);
    }
}
