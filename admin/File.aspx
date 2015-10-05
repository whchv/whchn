<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="gb2312" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="Infarts.BLL" %>
<%@ Import Namespace="Infarts.DAL" %>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        string temp = Request.QueryString["s"];
        int id = ShareInfoFactory.ToInt(temp.Split('_')[0].ToString());
        string tablename = string.Empty;
        if (temp.Split('_').Length > 1)
        {
            tablename = temp.Split('_')[1].ToString();
        }

        string upath = "";                                               //�ļ�·��������·��
        string baseUrl = "~/admin/upload/";                              //��·��
        string[] NeedExtension = { ".jpg", ".bmp", ".gif", ".jpeg", ".png" }; //ָ�����ϴ����ļ���

        for (int i = 0; i < Request.Files.Count; i++)
        {
            HttpPostedFile up = Request.Files[i];

            string fname = up.FileName;

            if (fname.Trim().Equals(""))
            {
                continue;
            }

            string fExtension = fname.Substring(fname.LastIndexOf('.'), fname.Length - fname.LastIndexOf('.')).ToLower();

            bool isEffective = false;
            for (int j = 0; j < NeedExtension.Length; j++)
            {
                if (fExtension.Equals(NeedExtension[j]))
                {
                    isEffective = true;
                    break;
                }
            }


            if (isEffective)
            {
                Guid temp1 = Guid.NewGuid();
                string a = temp1.ToString().Substring(6, 6);
                string rename = DateTime.Now.ToString("yyyyMMddHHmmssms") + "r" + a + fExtension;     //�������ļ�,   ��ֹ�ļ�����
                string ympath = "/" + DateTime.Now.Year.ToString() + "-" + DateTime.Now.ToString("MM"); //����Ŀ¼ ��-�� �������
                string ppath = Server.MapPath(baseUrl) + ympath;                        //�ļ�����·�� 
                string pfile = ppath + "/" + rename;

                upath = baseUrl + ympath + "/" + rename;

                Directory.CreateDirectory(ppath);
                up.SaveAs(pfile);

                upath = upath.Replace("~", Page.Request.ApplicationPath).Replace("//", "/");
                if (id != 0)
                {
                    if (tablename.ToLower() == "showcasephotos" || tablename.ToLower().Equals("showcasephotos"))
                    {
                        PublicMethod.AddCasePhoto("ShowCasePhotos", upath, id);
                    }
                }
            }
        }
    }
</script>