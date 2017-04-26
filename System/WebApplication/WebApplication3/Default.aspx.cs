﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Services.Description;

namespace WebApplication3
{

    public partial class _Default : Page
    {
        //public int result;

        public string conString = "Data Source=DESKTOP-FTCTJD0\\SQLEXPRESS;Initial Catalog=HRbase;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            //int res = 1;
            //String resultA = res.ToString();
            //resultA.Text = "1";
            //resultA.Text = res.ToString();
            //txtValueA.Text = "AAAAA";
            //call python, return vaue
            //声明一个程序信息类
            System.Diagnostics.ProcessStartInfo Info = new System.Diagnostics.ProcessStartInfo();
            //设置外部程序名
            Info.FileName = "ASP_testAddNum.exe";
            //设置外部程序的启动参数（命令行参数）为test.txt
            Info.Arguments = "1 2";
            //设置外部程序工作目录为  C:\
            Info.WorkingDirectory = "C:\\Users\\COMACDEV\\Documents\\Visual Studio 2017\\Projects\\ASP_testAddNum\\Debug";
            //声明一个程序类
            System.Diagnostics.Process Proc;

            try
            {
                //启动外部程序
                Proc = System.Diagnostics.Process.Start(Info);
  
            }
            
            catch (System.ComponentModel.Win32Exception exception)
            {
               Console.WriteLine("系统找不到指定的程序文件。\r{0}", exception);
                return;
            }
            //打印出外部程序的开始执行时间
            Console.WriteLine("外部程序的开始执行时间：{0}", Proc.StartTime);
            //等待3秒钟
            Proc.WaitForExit(3000);

            int res = Proc.ExitCode;
            //place a Literal control in the point you want to display the variable and then you set on PageLoad this value to the Literal Control
            resultA.Text = res.ToString();

            //如果这个外部程序没有结束运行则对其强行终止
            if (Proc.HasExited == false)
            {
                Console.WriteLine("由主程序强行终止外部程序的运行！");
                Proc.Kill();
            }
            else
            {
                Console.WriteLine("由外部程序正常退出！");
            }
            Console.WriteLine("外部程序的结束运行时间：{0}", Proc.ExitTime);
            Console.WriteLine("外部程序在结束运行时的返回值：{0}", Proc.ExitCode);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(conString);
                conn.Open();
                if (conn.State == System.Data.ConnectionState.Open)
                {
                    string q = "insert into Users (EMail, Password, Permission) values ('"+txtemail.Text.ToString()+"','"+txtpassword.Text.ToString()+"','"+txtpermission.Text.ToString()+"')";
                    SqlCommand cmd = new SqlCommand(q,conn);
                    cmd.ExecuteNonQuery();

                    Response.Write("Successful");
                    conn.Close();
                }
                
                
                
            }
            catch(Exception ex)
            {
                Response.Write("Error:"+ex.ToString());
            }
        }
    }
}