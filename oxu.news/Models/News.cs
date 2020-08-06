using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace oxu.news.Models
{
    public class News
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        [Required]
        public string Name { get; set; }
        public string Content { get; set; }
        public string ImageName { get; set; }
        [NotMapped]
        public IFormFile FormFile { get; set; }
        public DateTime CreationDate { get; set; }
        [DefaultValue(0)]
        public int Like { get; set; }
        [DefaultValue(0)]
        public int Dislike { get; set; }
        [DefaultValue(0)]
        public int View { get; set; }
    }
}
