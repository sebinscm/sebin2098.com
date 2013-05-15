<%!
/*------------------------------------------------------------------------
	- �Խ��� �ۼ��� ���Ǵ� �Լ���

		�ڵ带 �����ϱ� ���� ��Ģ�� ���� �ڹٺ�� �������
		�ʰ� ��κ� �ڵ带 jsp�� ���� �ֵ��� �����Ͽ����ϴ�.

	- ���۱�

		�� �Խ��� �ҽ��� ���� ��Ƽ�꽺��� �̿��Ͽ� �Խ����� �����ϴ� ����
		�Դϴ�.

		�� �Խ��� �ҽ��� ���۱��� (��)���߳������ͷ�Ƽ�꿡 ������ �����Ӱ� ����,
		����, ������ �� �ֽ��ϴ�.

		�� �Խ��� �ҽ� �� ������ �ҽ��� ���� �߻��ϴ� ��� å�ӿ� ���ؼ��� ��簡 ��������
		�ʽ��ϴ�.

		More information	: htpp://www.namo.com (US)
							: http://www.namo.co.kr (Korea)
							: http://www.namo.com/jp (Japan)
--------------------------------------------------------------------------*/
	/**
		���ڿ��� ������ ���ڿ��� ã�Ƽ� ���ο� ���ڿ��� �ٲٴ� �Լ�
		origianl	��� ���ڿ�
		oldstr		ã�� ���ڿ�
		newstr		�ٲ� ���ڿ�
		return		�ٲ� ���
	*/
	public String replace(String original, String oldstr, String newstr)
	{
		String convert = new String();
		int pos = 0;
		int begin = 0;
		pos = original.indexOf(oldstr);

		if(pos == -1)
			return original;

		while(pos != -1)
		{
			convert = convert + original.substring(begin, pos) + newstr;
			begin = pos + oldstr.length();
			pos = original.indexOf(oldstr, begin);
		}
		convert = convert + original.substring(begin);

		return convert;
	}

	/**
		������ HTML ������ȣ�� ���ڸ� HTML Ư����ȣ �������� ��ȯ�մϴ�.
		htmlstr		�ٲ� ����� ���ڿ�
		return		�ٲ� ���
		PHP�� htmlspecialchars�� ������ ����� ��ȯ�մϴ�.
	*/
	public String convertHtmlchars(String htmlstr)
	{
		String convert = new String();
		convert = replace(htmlstr, "&", "&amp;");
		convert = replace(convert, "<", "&lt;");
		convert = replace(convert, ">", "&gt;");
		convert = replace(convert, "\"", "&quot;");
		return convert;
	}
%>
