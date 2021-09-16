﻿using Data.Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Data.Repository
{
    public class User:IUser
    {
        private BookStoreModel db;
        public User(BookStoreModel db)
        {
            this.db = db;
        }
        public IEnumerable<Data.Entities.User> GetUsers()
        {
            return db.Users
                  .Include("Role")
                  .ToList();
        }
        public Data.Entities.User GetUserById(int id)
        {
            if (id > 0)
            {
                var user = db.Users
                    .Include(g => g.Role)
                    .Where(c => c.User_Id == id)
                    .FirstOrDefault();
                if (user != null)
                    return user;
                else
                {
                    return null;
                }
            }
            else
            {
                throw new ArgumentException("Id cannot be less than 0");
            }
        }
        public void AddUser(Data.Entities.User user)
        {
            db.Users.Add(user);
            save();
        }
        public void UpdateUserById(int id,Data.Entities.User user)
        {
            var getUser = db.Users.Where<Data.Entities.User>(u => u.User_Id == id).First();
            if (getUser != null)
            {
                db.Users.AddOrUpdate(user);
                save();
                return;
            }
            else
            {
                throw new ArgumentException($"No User Found With the id : {id}");
            }
            throw new ArgumentException("Id cannot be less than 0");
        }
        public void DeleteUserById(int id)
        {
            var user = db.Users.Where<Data.Entities.User>(u => u.User_Id == id).First();
            if (user != null)
            {
                db.Users.Remove(user);
                save();
                return;
            }
            else
            {
                throw new ArgumentException($"No User Found With the id : {id}");
            }
            throw new ArgumentException("Id cannot be less than 0");
        }
        public void save()
        {
            db.SaveChanges();
        }
    }
}
