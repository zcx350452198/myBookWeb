��html��
��head��
��title��php��ҳʾ����/title��
��meta http-equiv="Content-Type" content="text/html; charset=gb2312"�� 
��/head��

��body��
��?php
��$conn=mysql_connect("localhost","root","root");
��//�趨ÿһҳ��ʾ�ļ�¼��
��$pagesize=1;
��mysql_select_db("test",$conn);
��//ȡ�ü�¼����$rs��������ҳ����
��$rs=mysql_query("select count(*) from tb_product",$conn);
��$myrow = mysql_fetch_array($rs);
��$numrows=$myrow[0];
��//������ҳ��

��$pages=intval($numrows/$pagesize);
��if ($numrows%$pagesize)
����$pages++;
��//����ҳ��
��if (isset($_GET['page'])){
����$page=intval($_GET['page']);
��}
��else{
����//����Ϊ��һҳ 
����$page=1;
��}
��//�����¼ƫ����
��$offset=$pagesize*($page - 1);
��//��ȡָ����¼��
��$rs=mysql_query("select * from myTable order by id desc limit $offset,$pagesize",$conn);
��if ($myrow = mysql_fetch_array($rs))
��{
����$i=0;
����?��
������table border="0" width="80%"��
������tr��
��������td width="50%" bgcolor="#E0E0E0"��
����������p align="center"�����⣼/td��
����������td width="50%" bgcolor="#E0E0E0"��
����������p align="center"������ʱ�䣼/td��
������/tr��
������?php
������do {
��������$i++;
��������?��
������tr��
��������td width="50%"����?=$myrow["news_title"]?����/td��
��������td width="50%"����?=$myrow["news_cont"]?����/td��
������/tr��
��������?php
������}
������while ($myrow = mysql_fetch_array($rs));
��������echo "��/table��";
����}
����echo "��div align='center'������".$pages."ҳ(".$page."/".$pages.")";
����for ($i=1;$i�� $page;$i++)
������echo "��a href='fenye.php?page=".$i."'��[".$i ."]��/a�� ";
������echo "[".$page."]";
������for ($i=$page+1;$i��=$pages;$i++)
��������echo "��a href='fenye.php?page=".$i."'��[".$i ."]��/a�� ";
��������echo "��/div��";
������?��
������/body��
������/html�� 