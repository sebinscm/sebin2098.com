<%!
/*------------------------------------------------------------------------
	- 게시판 작성에 사용되는 함수들

		코드를 공개하기 위한 원칙에 따라서 자바빈즈를 사용하지
		않고 대부분 코드를 jsp를 볼수 있도록 구성하였습니다.

	- 저작권

		이 게시판 소스는 나모 액티브스퀘어를 이용하여 게시판을 구성하는 예제
		입니다.

		이 게시판 소스의 저작권은 (주)세중나모인터랙티브에 있으나 자유롭게 수정,
		복사, 배포할 수 있습니다.

		이 게시판 소스 및 수정한 소스로 인해 발생하는 모든 책임에 대해서는 당사가 보증하지
		않습니다.

		More information	: htpp://www.namo.com (US)
							: http://www.namo.co.kr (Korea)
							: http://www.namo.com/jp (Japan)
--------------------------------------------------------------------------*/
	/**
		문자열중 지정한 문자열을 찾아서 새로운 문자열로 바꾸는 함수
		origianl	대상 문자열
		oldstr		찾을 문자열
		newstr		바꿀 문자열
		return		바뀐 결과
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
		내용중 HTML 툭수기호인 문자를 HTML 특수기호 형식으로 변환합니다.
		htmlstr		바꿀 대상인 문자열
		return		바뀐 결과
		PHP의 htmlspecialchars와 유사한 결과를 반환합니다.
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
