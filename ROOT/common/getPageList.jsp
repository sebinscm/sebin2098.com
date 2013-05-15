<%!
// getPageList : return Paging String
String getPageList(int currentPage, int totalCount, int pageSize, int pageBlockSize) {
  int iTmp = (currentPage - 1)/pageBlockSize;
  int iBlockBegin = iTmp*pageBlockSize + 1;
  int iBlockEnd = iBlockBegin + pageBlockSize - 1;
  int iTotalPage = (totalCount - 1)/pageSize + 1;

  String pageList = "";

  // 첫페이지, 이전 페이지 이동
  if (currentPage > 1) {
    pageList += "<a href='javascript:fnGoPage(1);'>[First]</a>&nbsp;"
              + "<a href='javascript:fnGoPage("+ (currentPage - 1) + ");'>[Prev]</a>&nbsp;";
  } else {
    pageList += "[First]&nbsp;[Prev]&nbsp;";
  }

  // 이전 블록 이동
  if (iBlockBegin > pageBlockSize) {
    pageList += "<a href='javascript:fnGoPage(" + (iBlockBegin - 1) + ");'>...</a>&nbsp;";
  } else {
    pageList += "...&nbsp;";
  }

  // Block Paging
  for (int i = iBlockBegin; i <= iBlockEnd && i <= iTotalPage; i++) {
    if (i == currentPage) {
      pageList += "<b>" + i + "</b>&nbsp;";
    } else {
      pageList += "<a href='javascript:fnGoPage(" + i + ");'>" + i + "</a>&nbsp;";
    }
  }

  // 다음 블록 이동
  if (iBlockEnd < iTotalPage) {
    pageList += "<a href='javascript:fnGoPage("+ (iBlockEnd + 1) + ");'>...</a>&nbsp;";
  } else {
    pageList += "...&nbsp;";
  }

  // 다음 페이지 이동
  if (currentPage < iTotalPage) {
    pageList += "<a href='javascript:fnGoPage("+ (currentPage + 1) + ");'>[Next]</a>&nbsp;";
  } else {
    pageList += "[Next]&nbsp;";
  }

  // 마지막 페이지 이동
  if (currentPage < iTotalPage) {
    pageList += "<a href='javascript:fnGoPage("+ iTotalPage + ");'>[Last]</a>";
  } else {
    pageList += "[Last]";
  }

  return pageList;
}
%>
