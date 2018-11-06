﻿using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using SportsStore.Domain.Entities;
using SportsStore.Domain.Abstract;
using SportsStore.WebUI.Controllers;
using Moq;
using System.Web.Mvc;
using System.Linq;

namespace SportsStore.UnitTests
{
    [TestClass]
    public class ImageTests
    {
        [TestMethod]
        public void Can_Retrieve_Image_Data()
        {
            // Arrange - create a Product with image data
            Product prod = new Product
            {
                ProductID = 2,
                Name = "Test",
                ImageData = new byte[] { },
                ImageMimeType = "image/png"
            };
            // Arrange - create a mock repository
            Mock<IProductRepository> mock = new Mock<IProductRepository>();
            mock.Setup(m => m.Products).Returns(new Product[] {
                new Product { ProductID = 1, Name = "P1" },
                prod,
                new Product { ProductID = 3, Name = "P3" }
            });
            // Arrange - create a controller
            ProductController target = new ProductController(mock.Object);
            // Act - call the GetImage action method
            ActionResult result = target.GetImage(2);
            // Asert
            Assert.IsNotNull(result);
            Assert.IsInstanceOfType(result, typeof(FileResult));
            Assert.AreEqual(prod.ImageMimeType, ((FileResult)result).ContentType);
        }
        [TestMethod]
        public void Cannot_Retrieve_Image_Data_For_Invalid_ID()
        {
            Mock<IProductRepository> mock = new Mock<IProductRepository>();
            mock.Setup(m => m.Products).Returns(new Product[] {
                new Product { ProductID = 1, Name = "P1" },
                new Product { ProductID = 2, Name = "P2" }
            }.AsQueryable());
            // Arrange - create the controller
            ProductController target = new ProductController(mock.Object);
            // Act - call the GetImage action method
            ActionResult result = target.GetImage(100);
            // Assert
            Assert.IsNull(result); 
        }
    }
}
