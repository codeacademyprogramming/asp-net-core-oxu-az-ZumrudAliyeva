using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using oxu.news.Interfaces;
using oxu.news.Models;

namespace oxu.news.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class NewsController : Controller
    {
        INewsRepository _newsRepository;
        private readonly IWebHostEnvironment _webHost;

        public NewsController(INewsRepository newsRepository, IWebHostEnvironment webHost)
        {
            _newsRepository = newsRepository;
            _webHost = webHost;
        }
        public IActionResult Index()
        {
            return View(_newsRepository.GetAll());
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(News news)
        {
            News _news;

            if (ModelState.IsValid)
            {
                if (news.FormFile!=null)
                {
                    var newFileName =
                   $"{Path.GetFileNameWithoutExtension(news.FormFile.FileName)}" +
                   $"-{DateTime.Now.ToString("MM-dd-yyyy-HH-mm-ss")}" +
                   $"{Path.GetExtension(news.FormFile.FileName)}";

                    var rootPath = Path.Combine(_webHost.WebRootPath, "images", newFileName);

                    using (var fileStream = new FileStream(rootPath, FileMode.Create))
                    {
                        news.FormFile.CopyTo(fileStream);
                    }

                    news.ImageName = newFileName;

                _news = news;
                _newsRepository.Create(_news);

                return RedirectToAction("Index");
                }

            }
            return View(news);
        }


        [HttpPost]
        public IActionResult Delete(News news)
        {
            var currentnews = _newsRepository.Get(news.Id);

            currentnews = news;
            _newsRepository.Delete(currentnews);

            return RedirectToAction("Index");
        }

        public IActionResult Delete(int id)
        {
            var _news = _newsRepository.Get(id);

            return View(_news);
        }

        public IActionResult Edit(int? id)
        {

            var news = _newsRepository.Get(id);

            return View(news);
        }

        [HttpPost]
        public IActionResult Edit(News news)
        {
                News _news;

            if (ModelState.IsValid)
            {

                if (news.FormFile != null)
                {
                    var newFileName =
                   $"{Path.GetFileNameWithoutExtension(news.FormFile.FileName)}" +
                   $"-{DateTime.Now.ToString("MM-dd-yyyy-HH-mm-ss")}" +
                   $"{Path.GetExtension(news.FormFile.FileName)}";

                    var rootPath = Path.Combine(_webHost.WebRootPath, "images", newFileName);

                    using (var fileStream = new FileStream(rootPath, FileMode.Create))
                    {
                        news.FormFile.CopyTo(fileStream);
                    }

                    news.ImageName = newFileName;

                }
                    _news = news;
                    _newsRepository.Edit(_news);

                    return RedirectToAction("Index");

            }
            return View(news);
        }

        public IActionResult Details(int? id)
        {
            var _news = _newsRepository.Get(id);

            return View(_news);
        }

    }
}
