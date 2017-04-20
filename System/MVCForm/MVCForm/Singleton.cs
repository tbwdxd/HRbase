using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVCForm
{
    public class Singleton
    {
        private static Singleton instance;
        private static readonly object syncObject = new object();

        private Singleton()
        {

        }

        public static Singleton GetInstance()
        {
            if (instance == null)
            {
                lock (syncObject)
                {
                    if (instance == null)
                    {
                        instance = new Singleton();
                    }
                }
            }
            return instance;
        }
    }
}