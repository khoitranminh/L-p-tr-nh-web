using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DiDongStore.Models;

namespace DiDongStore.Controllers
{
    public class DiDongStoreController : Controller
    {
        // Tao 1 doi tuong chua toan bo CSDL tu dbDiDongStore
        dbDiDongStoreDataContext data = new dbDiDongStoreDataContext();

        private List<Phone> Laydienthoaimoi(int count)
        {
            // sap xep giam dan theo ID, lay count dong dau
            return data.Phones.OrderByDescending(a => a.ID).Take(count).ToList();
        }

        // GET: DiDongStore
        public ActionResult Index()
        {
            var dienthoaimoi = Laydienthoaimoi(6);
            return View(dienthoaimoi);
        }
        public ActionResult Hang()
        {
            var hang = from h in data.Companies select h;
            return PartialView(hang);
        }
        public ActionResult SPTheoHang(int id)
        {
            var phone = from p in data.Phones where p.ID == id select p;
            return View(phone);
        }
        public ActionResult Chitietphone(int id)
        {
            var phone = from p in data.Phones where p.ID == id select p;
            return View(phone.Single());
        }

    }
}