using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BankAccount
{
    /*internal interface ISavingsAccount
    {
        double CalculateSavingsInterest();
    }
    
    internal interface ICurrentAccount
    {
        double CalculateCurrentInterest();
    }

    
    internal interface IGoldLoanAccount
    {
        double CalculateGoldLoanInterest();
    }*/


    //Implementing the interaces
    class BankAccount : ISavingsAccount, ICurrentAccount, IGoldLoanAccount
    {
        public double Balance { get; set; }
        public double CalculateSavingsInterest()
        {
            return Balance * 0.09;
        }
        public double CalculateCurrentInterest()
        {
            return Balance * 0.07;
        }
        public double CalculateGoldLoanInterest()
        {
            return Balance * 0.04;
        }
    }
}
