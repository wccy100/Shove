using System;
using System.Collections;
using System.Text;
using System.Text.RegularExpressions;
using System.IO;
using System.Data;

namespace SZJS
{
    public partial class Lottery
    {
        /// <summary>
        /// ���ڿ���8
        /// </summary>
        public partial class SZKL8 : LotteryBase
        {
            #region ��̬����
            public const int PlayType_D = 3201;

            public const int ID = 32;
            public const string sID = "32";
            public const string Name = "���ڿ���8";
            public const string Code = "SZKL8";
            public const double MaxMoney = 2;
            #endregion

            public SZKL8()
            {
                id = 32;
                name = "���ڿ���8";
                code = "SZKL8";
            }

            public override bool CheckPlayType(int play_type) // id = 32
            {
                return ((play_type == 3201));
            }

            public override PlayType[] GetPlayTypeList()
            {
                PlayType[] Result = new PlayType[1];

                Result[0] = new PlayType(PlayType_D, "����");

                return Result;
            }

            public override string BuildNumber(int Num, int Type)//  Type: 8 = ѡ8,7 = ѡ7,6 = ѡ6,5 = ѡ5, 4 = ѡ4,3 = ѡ3,2 = ѡ2,1 = ѡ1 
            {
                if ((Type != 8) && (Type != 7) && (Type != 6) && (Type != 5) && (Type != 4) && (Type != 3) && (Type != 2) && (Type != 1))
                    Type = 8;

                System.Random rd = new Random();
                StringBuilder sb = new StringBuilder();
                ArrayList al = new ArrayList();

                for (int i = 0; i < Num; i++)
                {
                    string LotteryNumber = "";
                    for (int j = 0; j < Type; j++)
                    {
                        int Ball = 0;
                        while ((Ball == 0) || isExistBall(al, Ball))
                            Ball = rd.Next(1, 80 + 1);
                        al.Add(Ball.ToString().PadLeft(2, '0'));
                    }
                    CompareToAscii compare = new CompareToAscii();
                    al.Sort(compare);

                    for (int j = 0; j < al.Count; j++)
                        LotteryNumber += al[j].ToString() + " ";

                    sb.Append(LotteryNumber.Trim() + "\n");
                }

                string Result = sb.ToString();
                Result = Result.Substring(0, Result.Length - 1);
                return Result;
            }

            public override string[] ToSingle(string Number, ref string CanonicalNumber, int PlayType)	// ���� ref �����ǽ���Ʊ�淶�����磺01 01 02... ��� 01 02...
            {
                string[] strs = FilterRepeated(Number.Trim().Split(' '));
                CanonicalNumber = "";

                if (strs.Length < 1)
                {
                    CanonicalNumber = "";
                    return null;
                }

                for (int i = 0; ((i < strs.Length) && (i < 8)); i++)
                    CanonicalNumber += (strs[i] + " ");
                CanonicalNumber = CanonicalNumber.Trim();

                string[] Result = new string[1];
                Result[0] = CanonicalNumber;

                return Result;
            }

            public override double ComputeWin(string Number, string WinNumber, ref string Description, ref double WinMoneyNoWithTax, int PlayType, params double[] WinMoneyList)
            {
                WinNumber = WinNumber.Trim();
                if (WinNumber.Length < 59)	//59: "01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20"
                    return -1;

                string[] Lotterys = SplitLotteryNumber(Number);
                if (Lotterys == null)
                    return -2;
                if (Lotterys.Length < 1)
                    return -2;

                if ((WinMoneyList == null) || (WinMoneyList.Length < 50)) //�����������˳��X8(0-11),X7(12,21),X6(22,29) X5(30,35)X4(36,41),X3(42,45),X2(46,47),X1(48,49) 
                    return -3;

                int Description8_1 = 0, Description8_2 = 0, Description8_3 = 0, Description8_4 = 0, Description8_5 = 0, Description8_6 = 0;
                int Description7_1 = 0, Description7_2 = 0, Description7_3 = 0, Description7_4 = 0, Description7_5 = 0;
                int Description6_1 = 0, Description6_2 = 0, Description6_3 = 0, Description6_4 = 0;
                int Description5_1 = 0, Description5_2 = 0, Description5_3 = 0;
                int Description4_1 = 0, Description4_2 = 0, Description4_3 = 0;
                int Description3_1 = 0, Description3_2 = 0;
                int Description2_1 = 0;
                int Description1_1 = 0;

                double WinMoney = 0;
                WinMoneyNoWithTax = 0;

                for (int ii = 0; ii < Lotterys.Length; ii++)
                {
                    string t_str = "";
                    string[] Lottery = ToSingle(Lotterys[ii], ref t_str, PlayType_D);
                    if ((Lottery == null) || (Lottery.Length < 1))
                        continue;

                    for (int i = 0; i < Lottery.Length; i++)
                    {
                        int t_Description8_1 = 0, t_Description8_2 = 0, t_Description8_3 = 0, t_Description8_4 = 0, t_Description8_5 = 0, t_Description8_6 = 0;
                        int t_Description7_1 = 0, t_Description7_2 = 0, t_Description7_3 = 0, t_Description7_4 = 0, t_Description7_5 = 0;
                        int t_Description6_1 = 0, t_Description6_2 = 0, t_Description6_3 = 0, t_Description6_4 = 0;
                        int t_Description5_1 = 0, t_Description5_2 = 0, t_Description5_3 = 0;
                        int t_Description4_1 = 0, t_Description4_2 = 0, t_Description4_3 = 0;
                        int t_Description3_1 = 0, t_Description3_2 = 0;
                        int t_Description2_1 = 0;
                        int t_Description1_1 = 0;

                        double t_WinMoney = 0;
                        double t_WinMoneyNoWithTax = 0;

                        switch (Shove._String.StringAt(Lottery[i], ' ') + 1)
                        {
                            case 8:
                                t_WinMoney = ComputeWin_8(Lottery[i], WinNumber, ref t_WinMoneyNoWithTax, WinMoneyList[0], WinMoneyList[1], WinMoneyList[2], WinMoneyList[3],
                                    WinMoneyList[4], WinMoneyList[5], WinMoneyList[6], WinMoneyList[7], WinMoneyList[8], WinMoneyList[9], WinMoneyList[10], WinMoneyList[11],
                                    ref t_Description8_1, ref t_Description8_2, ref t_Description8_3, ref t_Description8_4, ref t_Description8_5, ref t_Description8_6);
                                break;
                            case 7:
                                t_WinMoney = ComputeWin_7(Lottery[i], WinNumber, ref t_WinMoneyNoWithTax, WinMoneyList[12], WinMoneyList[13], WinMoneyList[14], WinMoneyList[15],
                                    WinMoneyList[16], WinMoneyList[17], WinMoneyList[18], WinMoneyList[19], WinMoneyList[20], WinMoneyList[21],
                                    ref t_Description7_1, ref t_Description7_2, ref t_Description7_3, ref t_Description7_4, ref t_Description7_5);
                                break;
                            case 6:
                                t_WinMoney = ComputeWin_6(Lottery[i], WinNumber, ref t_WinMoneyNoWithTax, WinMoneyList[22], WinMoneyList[23], WinMoneyList[24], WinMoneyList[25],
                                    WinMoneyList[26], WinMoneyList[27], WinMoneyList[28], WinMoneyList[29],
                                    ref t_Description6_1, ref t_Description6_2, ref t_Description6_3, ref t_Description6_4);
                                break;
                            case 5:
                                t_WinMoney = ComputeWin_5(Lottery[i], WinNumber, ref t_WinMoneyNoWithTax, WinMoneyList[30], WinMoneyList[31], WinMoneyList[32], WinMoneyList[33],
                                    WinMoneyList[34], WinMoneyList[35],
                                    ref t_Description5_1, ref t_Description5_2, ref t_Description5_3);
                                break;
                            case 4:
                                t_WinMoney = ComputeWin_4(Lottery[i], WinNumber, ref t_WinMoneyNoWithTax, WinMoneyList[36], WinMoneyList[37], WinMoneyList[38], WinMoneyList[39],
                                    WinMoneyList[40], WinMoneyList[41],
                                    ref t_Description4_1, ref t_Description4_2, ref t_Description4_3);
                                break;
                            case 3:
                                t_WinMoney = ComputeWin_3(Lottery[i], WinNumber, ref t_WinMoneyNoWithTax, WinMoneyList[42], WinMoneyList[43], WinMoneyList[44], WinMoneyList[45],
                                    ref t_Description3_1, ref t_Description3_2);
                                break;
                            case 2:
                                t_WinMoney = ComputeWin_2(Lottery[i], WinNumber, ref t_WinMoneyNoWithTax, WinMoneyList[46], WinMoneyList[47],
                                    ref t_Description2_1);
                                break;
                            case 1:
                                t_WinMoney = ComputeWin_1(Lottery[i], WinNumber, ref t_WinMoneyNoWithTax, WinMoneyList[48], WinMoneyList[49],
                                    ref t_Description1_1);
                                break;
                            default:
                                continue;
                        }

                        Description8_1 += t_Description8_1; Description8_2 += t_Description8_2; Description8_3 += t_Description8_3; Description8_4 += t_Description8_4; Description8_5 += t_Description8_5; Description8_6 += t_Description8_6;
                        Description7_1 += t_Description7_1; Description7_2 += t_Description7_2; Description7_3 += t_Description7_3; Description7_4 += t_Description7_4; Description7_5 += t_Description7_5;
                        Description6_1 += t_Description6_1; Description6_2 += t_Description6_2; Description6_3 += t_Description6_3; Description6_4 += t_Description6_4;
                        Description5_1 += t_Description5_1; Description5_2 += t_Description5_2; Description5_3 += t_Description5_3;
                        Description4_1 += t_Description4_1; Description4_2 += t_Description4_2; Description4_3 += t_Description4_3;
                        Description3_1 += t_Description3_1; Description3_2 += t_Description3_2;
                        Description2_1 += t_Description2_1;
                        Description1_1 += t_Description1_1;

                        WinMoney += t_WinMoney;
                        WinMoneyNoWithTax += t_WinMoneyNoWithTax;
                    }
                }

                Description = "";
                #region ��� Description
                if (Description8_1 > 0)
                {
                    if (Description != "")
                        Description += "��";
                    Description += "ѡ8��8��" + Description8_1.ToString() + "ע";
                }
                if (Description8_2 > 0)
                {
                    if (Description != "")
                        Description += "��";
                    Description += "ѡ8��7��" + Description8_2.ToString() + "ע";
                }
                if (Description8_3 > 0)
                {
                    if (Description != "")
                        Description += "��";
                    Description += "ѡ8��6��" + Description8_3.ToString() + "ע";
                }
                if (Description8_4 > 0)
                {
                    if (Description != "")
                        Description += "��";
                    Description += "ѡ8��5��" + Description8_4.ToString() + "ע";
                }
                if (Description8_5 > 0)
                {
                    if (Description != "")
                        Description += "��";
                    Description += "ѡ8��4��" + Description8_5.ToString() + "ע";
                }
                if (Description8_6 > 0)
                {
                    if (Description != "")
                        Description += "��";
                    Description += "ѡ8��0��" + Description8_6.ToString() + "ע";
                }

                if (Description7_1 > 0)
                {
                    if (Description != "")
                        Description += "��";
                    Description += "ѡ7��7��" + Description7_1.ToString() + "ע";
                }
                if (Description7_2 > 0)
                {
                    if (Description != "")
                        Description += "��";
                    Description += "ѡ7��6��" + Description7_2.ToString() + "ע";
                }
                if (Description7_3 > 0)
                {
                    if (Description != "")
                        Description += "��";
                    Description += "ѡ7��5��" + Description7_3.ToString() + "ע";
                }
                if (Description7_4 > 0)
                {
                    if (Description != "")
                        Description += "��";
                    Description += "ѡ7��4��" + Description7_4.ToString() + "ע";
                }
                if (Description7_5 > 0)
                {
                    if (Description != "")
                        Description += "��";
                    Description += "ѡ7��0��" + Description7_5.ToString() + "ע";
                }

                if (Description6_1 > 0)
                {
                    if (Description != "")
                        Description += "��";
                    Description += "ѡ6��6��" + Description6_1.ToString() + "ע";
                }
                if (Description6_2 > 0)
                {
                    if (Description != "")
                        Description += "��";
                    Description += "ѡ6��5��" + Description6_2.ToString() + "ע";
                }
                if (Description6_3 > 0)
                {
                    if (Description != "")
                        Description += "��";
                    Description += "ѡ6��4��" + Description6_3.ToString() + "ע";
                }
                if (Description6_4 > 0)
                {
                    if (Description != "")
                        Description += "��";
                    Description += "ѡ6��3��" + Description6_4.ToString() + "ע";
                }

                if (Description5_1 > 0)
                {
                    if (Description != "")
                        Description += "��";
                    Description += "ѡ5��5��" + Description5_1.ToString() + "ע";
                }
                if (Description5_2 > 0)
                {
                    if (Description != "")
                        Description += "��";
                    Description += "ѡ5��4��" + Description5_2.ToString() + "ע";
                }
                if (Description5_3 > 0)
                {
                    if (Description != "")
                        Description += "��";
                    Description += "ѡ5��3��" + Description5_3.ToString() + "ע";
                }

                if (Description4_1 > 0)
                {
                    if (Description != "")
                        Description += "��";
                    Description += "ѡ4��4��" + Description4_1.ToString() + "ע";
                }
                if (Description4_2 > 0)
                {
                    if (Description != "")
                        Description += "��";
                    Description += "ѡ4��3��" + Description4_2.ToString() + "ע";
                }
                if (Description4_3 > 0)
                {
                    if (Description != "")
                        Description += "��";
                    Description += "ѡ4��2��" + Description4_3.ToString() + "ע";
                }

                if (Description3_1 > 0)
                {
                    if (Description != "")
                        Description += "��";
                    Description += "ѡ3��3��" + Description3_1.ToString() + "ע";
                }
                if (Description3_2 > 0)
                {
                    if (Description != "")
                        Description += "��";
                    Description += "ѡ3��2��" + Description3_2.ToString() + "ע";
                }

                if (Description2_1 > 0)
                {
                    if (Description != "")
                        Description += "��";
                    Description += "ѡ2��2��" + Description2_1.ToString() + "ע";
                }

                if (Description1_1 > 0)
                {
                    if (Description != "")
                        Description += "��";
                    Description += "ѡ2��2��" + Description1_1.ToString() + "ע";
                }

                if (Description != "")
                    Description += "��";
                #endregion

                return WinMoney;
            }
            #region ComputeWin  �ľ��巽��
            private Double ComputeWin_8(string Number, string WinNumber, ref double WinMoneyNoWithTax,
                double WinMoney1, double WinMoneyNoWithTax1, double WinMoney2, double WinMoneyNoWithTax2, double WinMoney3, double WinMoneyNoWithTax3,
                double WinMoney4, double WinMoneyNoWithTax4, double WinMoney5, double WinMoneyNoWithTax5, double WinMoney6, double WinMoneyNoWithTax6,
                ref int Description1, ref int Description2, ref int Description3, ref int Description4, ref int Description5, ref int Description6)
            {
                Description1 = 0; Description2 = 0; Description3 = 0; Description4 = 0; Description5 = 0; Description6 = 0;
                double WinMoney = 0;
                WinMoneyNoWithTax = 0;

                string[] Red = new string[8];

                Regex regex = new Regex(@"(?<R0>\d\d\s)(?<R1>\d\d\s)(?<R2>\d\d\s)(?<R3>\d\d\s)(?<R4>\d\d\s)(?<R5>\d\d\s)(?<R6>\d\d\s)(?<R7>\d\d)", RegexOptions.IgnoreCase | RegexOptions.Compiled);
                Match m = regex.Match(Number);

                int RedRight = 0;

                for (int j = 0; j < 8; j++)
                {
                    Red[j] = m.Groups["R" + j.ToString()].ToString().Trim();

                    if (WinNumber.IndexOf(Red[j]) >= 0)
                        RedRight++;
                }

                if (RedRight == 8)
                {
                    Description1++;
                    WinMoney += WinMoney1;
                    WinMoneyNoWithTax += WinMoneyNoWithTax1;
                }

                else if (RedRight == 7)
                {
                    Description2++;
                    WinMoney += WinMoney2;
                    WinMoneyNoWithTax += WinMoneyNoWithTax2;
                }

                else if (RedRight == 6)
                {
                    Description3++;
                    WinMoney += WinMoney3;
                    WinMoneyNoWithTax += WinMoneyNoWithTax3;
                }

                else if (RedRight == 5)
                {
                    Description4++;
                    WinMoney += WinMoney4;
                    WinMoneyNoWithTax += WinMoneyNoWithTax4;
                }

                else if (RedRight == 4)
                {
                    Description5++;
                    WinMoney += WinMoney5;
                    WinMoneyNoWithTax += WinMoneyNoWithTax5;
                }

                else if (RedRight == 0)
                {
                    Description6++;
                    WinMoney += WinMoney6;
                    WinMoneyNoWithTax += WinMoneyNoWithTax6;
                }

                return WinMoney;
            }
            private Double ComputeWin_7(string Number, string WinNumber, ref double WinMoneyNoWithTax,
                double WinMoney1, double WinMoneyNoWithTax1, double WinMoney2, double WinMoneyNoWithTax2, double WinMoney3, double WinMoneyNoWithTax3,
                double WinMoney4, double WinMoneyNoWithTax4, double WinMoney5, double WinMoneyNoWithTax5,
                ref int Description1, ref int Description2, ref int Description3, ref int Description4, ref int Description5)
            {
                Description1 = 0; Description2 = 0; Description3 = 0; Description4 = 0; Description5 = 0;
                double WinMoney = 0;
                WinMoneyNoWithTax = 0;

                string[] Red = new string[7];

                Regex regex = new Regex(@"(?<R0>\d\d\s)(?<R1>\d\d\s)(?<R2>\d\d\s)(?<R3>\d\d\s)(?<R4>\d\d\s)(?<R5>\d\d\s)(?<R6>\d\d)", RegexOptions.IgnoreCase | RegexOptions.Compiled);
                Match m = regex.Match(Number);

                int RedRight = 0;

                for (int j = 0; j < 7; j++)
                {
                    Red[j] = m.Groups["R" + j.ToString()].ToString().Trim();

                    if (WinNumber.IndexOf(Red[j]) >= 0)
                        RedRight++;
                }

                if (RedRight == 7)
                {
                    Description1++;
                    WinMoney += WinMoney1;
                    WinMoneyNoWithTax += WinMoneyNoWithTax1;
                }

                else if (RedRight == 6)
                {
                    Description2++;
                    WinMoney += WinMoney2;
                    WinMoneyNoWithTax += WinMoneyNoWithTax2;
                }

                else if (RedRight == 5)
                {
                    Description3++;
                    WinMoney += WinMoney3;
                    WinMoneyNoWithTax += WinMoneyNoWithTax3;
                }

                else if (RedRight == 4)
                {
                    Description4++;
                    WinMoney += WinMoney4;
                    WinMoneyNoWithTax += WinMoneyNoWithTax4;
                }

                else if (RedRight == 0)
                {
                    Description5++;
                    WinMoney += WinMoney5;
                    WinMoneyNoWithTax += WinMoneyNoWithTax5;
                }

                return WinMoney;
            }
            private Double ComputeWin_6(string Number, string WinNumber, ref double WinMoneyNoWithTax,
                double WinMoney1, double WinMoneyNoWithTax1, double WinMoney2, double WinMoneyNoWithTax2, double WinMoney3, double WinMoneyNoWithTax3,
                double WinMoney4, double WinMoneyNoWithTax4,
                ref int Description1, ref int Description2, ref int Description3, ref int Description4)
            {
                Description1 = 0; Description2 = 0; Description3 = 0; Description4 = 0;
                double WinMoney = 0;
                WinMoneyNoWithTax = 0;

                string[] Red = new string[6];

                Regex regex = new Regex(@"(?<R0>\d\d\s)(?<R1>\d\d\s)(?<R2>\d\d\s)(?<R3>\d\d\s)(?<R4>\d\d\s)(?<R5>\d\d)", RegexOptions.IgnoreCase | RegexOptions.Compiled);
                Match m = regex.Match(Number);

                int RedRight = 0;

                for (int j = 0; j < 6; j++)
                {
                    Red[j] = m.Groups["R" + j.ToString()].ToString().Trim();

                    if (WinNumber.IndexOf(Red[j]) >= 0)
                        RedRight++;
                }

                if (RedRight == 6)
                {
                    Description1++;
                    WinMoney += WinMoney1;
                    WinMoneyNoWithTax += WinMoneyNoWithTax1;
                }

                else if (RedRight == 5)
                {
                    Description2++;
                    WinMoney += WinMoney2;
                    WinMoneyNoWithTax += WinMoneyNoWithTax2;
                }

                else if (RedRight == 4)
                {
                    Description3++;
                    WinMoney += WinMoney3;
                    WinMoneyNoWithTax += WinMoneyNoWithTax3;
                }

                else if (RedRight == 3)
                {
                    Description4++;
                    WinMoney += WinMoney4;
                    WinMoneyNoWithTax += WinMoneyNoWithTax4;
                }

                return WinMoney;
            }
            private Double ComputeWin_5(string Number, string WinNumber, ref double WinMoneyNoWithTax,
                double WinMoney1, double WinMoneyNoWithTax1, double WinMoney2, double WinMoneyNoWithTax2, double WinMoney3, double WinMoneyNoWithTax3,
                ref int Description1, ref int Description2, ref int Description3)
            {
                Description1 = 0; Description2 = 0; Description3 = 0;
                double WinMoney = 0;
                WinMoneyNoWithTax = 0;

                string[] Red = new string[5];

                Regex regex = new Regex(@"(?<R0>\d\d\s)(?<R1>\d\d\s)(?<R2>\d\d\s)(?<R3>\d\d\s)(?<R4>\d\d)", RegexOptions.IgnoreCase | RegexOptions.Compiled);
                Match m = regex.Match(Number);

                int RedRight = 0;

                for (int j = 0; j < 5; j++)
                {
                    Red[j] = m.Groups["R" + j.ToString()].ToString().Trim();

                    if (WinNumber.IndexOf(Red[j]) >= 0)
                        RedRight++;
                }

                if (RedRight == 5)
                {
                    Description1++;
                    WinMoney += WinMoney1;
                    WinMoneyNoWithTax += WinMoneyNoWithTax1;
                }

                else if (RedRight == 4)
                {
                    Description2++;
                    WinMoney += WinMoney2;
                    WinMoneyNoWithTax += WinMoneyNoWithTax2;
                }

                else if (RedRight == 3)
                {
                    Description3++;
                    WinMoney += WinMoney3;
                    WinMoneyNoWithTax += WinMoneyNoWithTax3;
                }

                return WinMoney;
            }
            private Double ComputeWin_4(string Number, string WinNumber, ref double WinMoneyNoWithTax,
                double WinMoney1, double WinMoneyNoWithTax1, double WinMoney2, double WinMoneyNoWithTax2, double WinMoney3, double WinMoneyNoWithTax3,
                ref int Description1, ref int Description2, ref int Description3)
            {
                Description1 = 0; Description2 = 0; Description3 = 0;
                double WinMoney = 0;
                WinMoneyNoWithTax = 0;

                string[] Red = new string[4];

                Regex regex = new Regex(@"(?<R0>\d\d\s)(?<R1>\d\d\s)(?<R2>\d\d\s)(?<R3>\d\d)", RegexOptions.IgnoreCase | RegexOptions.Compiled);
                Match m = regex.Match(Number);

                int RedRight = 0;

                for (int j = 0; j < 4; j++)
                {
                    Red[j] = m.Groups["R" + j.ToString()].ToString().Trim();

                    if (WinNumber.IndexOf(Red[j]) >= 0)
                        RedRight++;
                }

                if (RedRight == 4)
                {
                    Description1++;
                    WinMoney += WinMoney1;
                    WinMoneyNoWithTax += WinMoneyNoWithTax1;
                }

                else if (RedRight == 3)
                {
                    Description2++;
                    WinMoney += WinMoney2;
                    WinMoneyNoWithTax += WinMoneyNoWithTax2;
                }

                else if (RedRight == 2)
                {
                    Description3++;
                    WinMoney += WinMoney3;
                    WinMoneyNoWithTax += WinMoneyNoWithTax3;
                }

                return WinMoney;
            }
            private Double ComputeWin_3(string Number, string WinNumber, ref double WinMoneyNoWithTax,
                double WinMoney1, double WinMoneyNoWithTax1, double WinMoney2, double WinMoneyNoWithTax2,
                ref int Description1, ref int Description2)
            {
                Description1 = 0; Description2 = 0;
                double WinMoney = 0;
                WinMoneyNoWithTax = 0;

                string[] Red = new string[3];

                Regex regex = new Regex(@"(?<R0>\d\d\s)(?<R1>\d\d\s)(?<R2>\d\d)", RegexOptions.IgnoreCase | RegexOptions.Compiled);
                Match m = regex.Match(Number);

                int RedRight = 0;

                for (int j = 0; j < 3; j++)
                {
                    Red[j] = m.Groups["R" + j.ToString()].ToString().Trim();

                    if (WinNumber.IndexOf(Red[j]) >= 0)
                        RedRight++;
                }

                if (RedRight == 3)
                {
                    Description1++;
                    WinMoney += WinMoney1;
                    WinMoneyNoWithTax += WinMoneyNoWithTax1;
                }

                else if (RedRight == 2)
                {
                    Description2++;
                    WinMoney += WinMoney2;
                    WinMoneyNoWithTax += WinMoneyNoWithTax2;
                }

                return WinMoney;
            }
            private Double ComputeWin_2(string Number, string WinNumber, ref double WinMoneyNoWithTax,
                double WinMoney1, double WinMoneyNoWithTax1,
                ref int Description1)
            {
                Description1 = 0;
                double WinMoney = 0;
                WinMoneyNoWithTax = 0;

                string[] Red = new string[2];

                Regex regex = new Regex(@"(?<R0>\d\d\s)(?<R1>\d\d)", RegexOptions.IgnoreCase | RegexOptions.Compiled);
                Match m = regex.Match(Number);

                int RedRight = 0;

                for (int j = 0; j < 2; j++)
                {
                    Red[j] = m.Groups["R" + j.ToString()].ToString().Trim();

                    if (WinNumber.IndexOf(Red[j]) >= 0)
                        RedRight++;
                }

                if (RedRight == 2)
                {
                    Description1++;
                    WinMoney += WinMoney1;
                    WinMoneyNoWithTax += WinMoneyNoWithTax1;
                }

                return WinMoney;
            }
            private Double ComputeWin_1(string Number, string WinNumber, ref double WinMoneyNoWithTax,
                double WinMoney1, double WinMoneyNoWithTax1,
                ref int Description1)
            {
                Description1 = 0;
                double WinMoney = 0;
                WinMoneyNoWithTax = 0;

                if (WinNumber.IndexOf(Number) >= 0)
                {
                    Description1++;
                    WinMoney += WinMoney1;
                    WinMoneyNoWithTax += WinMoneyNoWithTax1;
                }

                return WinMoney;
            }
            #endregion

            public override string AnalyseScheme(string Content, int PlayType)
            {
                string[] strs = Content.Split('\n');
                if (strs == null)
                    return "";
                if (strs.Length == 0)
                    return "";

                string Result = "";

                Regex regex = new Regex(@"(\d\d\s){0,7}\d\d", RegexOptions.Compiled | RegexOptions.IgnoreCase);

                for (int i = 0; i < strs.Length; i++)
                {
                    Match m = regex.Match(strs[i]);
                    if (m.Success)
                    {
                        string CanonicalNumber = "";
                        string[] singles = ToSingle(m.Value, ref CanonicalNumber, PlayType);

                        if (singles == null)
                            continue;

                        if (singles.Length >= 1)
                            Result += CanonicalNumber + "|" + singles.Length.ToString() + "\n";
                    }
                }

                if (Result.EndsWith("\n"))
                    Result = Result.Substring(0, Result.Length - 1);

                return Result;
            }

            public override bool AnalyseWinNumber(string Number)
            {
                string[] WinLotteryNumber = FilterRepeated(Number.Split(' '));

                if ((WinLotteryNumber == null) || (WinLotteryNumber.Length != 20))
                    return false;

                return true;
            }

            private string[] FilterRepeated(string[] NumberPart)
            {
                ArrayList al = new ArrayList();
                for (int i = 0; i < NumberPart.Length; i++)
                {
                    int Ball = Shove._Convert.StrToInt(NumberPart[i], -1);
                    if ((Ball >= 1) && (Ball <= 80) && (!isExistBall(al, Ball)))
                        al.Add(NumberPart[i]);
                }

                CompareToAscii compare = new CompareToAscii();
                al.Sort(compare);

                string[] Result = new string[al.Count];
                for (int i = 0; i < al.Count; i++)
                    Result[i] = al[i].ToString().PadLeft(2, '0');

                return Result;
            }

            public override string ShowNumber(string Number)
            {
                return base.ShowNumber(Number, "");
            }
        }
    }
}