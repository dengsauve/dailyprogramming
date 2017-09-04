using System;
using System.Collections.Generic;
using System.Linq;
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

            List<int> set = Enumerable.Range(1, input).ToList();

            set.RemoveAll(n => n % 2 == 0);
            set.RemoveAll(n => (n + 1) % 6 == 0);

            while(ll_num < set.Count)
            {

            }

            return set;
        }




        static void Main(string[] args)
        {
            List<int> nums = createSet(50);
            int num = 7;
            Console.WriteLine(isLucky(num, nums));
        }
    }
}
