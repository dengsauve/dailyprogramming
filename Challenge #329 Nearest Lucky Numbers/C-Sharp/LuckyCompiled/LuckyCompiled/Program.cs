using System;
using System.Collections.Generic;
using System.Linq;
using System.Diagnostics;
using System.Text;
using System.Threading.Tasks;

namespace LuckyCompiled
{
    class Program
    {
        static bool isLucky(int num, List<int> nums)
        {
            return nums.IndexOf(num) != -1;
        }

        static List<int> createSet(int input)
        {
            int index = 1;
            int ll_num = 1;
            int limit;

            var set = Enumerable.Range(1, input + 20).ToList();

            set.RemoveAll(n => n % 2 == 0);
            set.RemoveAll(n => (n + 1) % 6 == 0);

            while(ll_num < set.Count)
            {
                index += 1;
                ll_num = set[index];

                limit = (set.Count - 1) / ll_num * ll_num;
                for (var i = -limit; i < -ll_num; i += ll_num)
                {
                    set.RemoveAt(-i);
                }
            }

            return set;
        }




        static void Main(string[] args)
        {
            Stopwatch casio = new Stopwatch();
            int num = 10000000;
            casio.Start();
            var nums = createSet(num);
            Console.WriteLine(isLucky(num, nums));
            casio.Stop();
            Console.WriteLine(casio.Elapsed);
            //nums.ForEach(Console.WriteLine);
            //Console.ReadKey();


        }
    }
}
