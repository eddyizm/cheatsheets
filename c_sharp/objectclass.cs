using System;
using System.Collections.Generic;
using System.Text;


namespace Consulting.LaborMatrix
{
    public class LaborPriceData 
    {
        private string mCustomerNumber = string.Empty;
        private string mLocation = string.Empty;
        private string mDivision = string.Empty;
        private string mLaborGroup = string.Empty;
        private string mPriceMatrix = string.Empty;

        public LaborPriceData(string pCustomerNumber, string pLocation, string pDivision, string pLaborGroup, string pPriceMatrix)
        {
            this.mCustomerNumber = pCustomerNumber;
            this.mLocation = pLocation;
            this.mDivision = pDivision;
            this.mPriceMatrix  = pLaborGroup;
            this.mPriceMatrix = pPriceMatrix;
        }
    
        public string pCustomerNumber
        {
            get
            {
                return mCustomerNumber;
            }
            set { }
        }
        public string pLocation
        {
            get
            {
                return mLocation;
            }
            set { }
        }
        public string pDivision
        {
            get
            {
                return mDivision;
            }
            set { }
        }
        public string pLaborGroup
        {
            get
            {
                return mLaborGroup;
            }
            set { }
        }
        public string pPriceMatrix
        {
            get
            {
                return mPriceMatrix;
            }
            set { }
        }
    }
}
