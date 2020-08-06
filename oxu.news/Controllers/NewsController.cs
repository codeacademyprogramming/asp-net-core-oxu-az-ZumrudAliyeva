using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using oxu.news.Interfaces;
using oxu.news.Models;

namespace oxu.news.Controllers
{
    public class NewsController : Controller
    {
        INewsRepository _newsRepository;
        public NewsController(INewsRepository newsRepository)
        {
            _newsRepository = newsRepository;
        }
        public IActionResult Index()
        {
            return View(_newsRepository.GetAll());
        }

        public IActionResult Get(int? id)
        {
            var _news = _newsRepository.Get(id);

            _newsRepository.IncreaseView(_news);

            return View(_news);
        }


        public IActionResult IncreaseLike(News news)
        {
            var currentnews = _newsRepository.Get(news.Id);

            _newsRepository.IncreaseLike(currentnews);

            return RedirectToAction("Index");
        }

        public IActionResult IncreaseDislike(News news)
        {
            var currentnews = _newsRepository.Get(news.Id);

            _newsRepository.IncreaseDislike(currentnews);

            return RedirectToAction("Index");
        }

    }
}
