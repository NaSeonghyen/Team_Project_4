package com.ot4zo.controller;

import com.board.controller.action.BoardCheckPassAction;
import com.board.controller.action.BoardCheckPassFormAction;
import com.board.controller.action.BoardDeleteAction;
import com.board.controller.action.BoardKeywordListPageAction;
import com.board.controller.action.BoardListPageAction;
import com.board.controller.action.BoardUpdateAction;
import com.board.controller.action.BoardUpdateFormAction;
import com.board.controller.action.BoardViewAction;
import com.board.controller.action.BoardWriteAction;
import com.board.controller.action.BoardWriteFormAction;
import com.member.controller.action.Action;
import com.member.controller.action.IdCheckFormAction;
import com.member.controller.action.IdSearchAction;
import com.member.controller.action.IndexAction;
import com.member.controller.action.JoinAction;
import com.member.controller.action.JoinFormAction;
import com.member.controller.action.LoginAction;
import com.member.controller.action.LoginFormAction;
import com.member.controller.action.LogoutAction;
import com.member.controller.action.PwChangeAction;
import com.member.controller.action.PwChangeFormAction;
import com.member.controller.action.PwSearchAction;
import com.mypage.controller.action.CartDeleteAction;
import com.mypage.controller.action.CartInsertAction;
import com.mypage.controller.action.CartListAction;
import com.mypage.controller.action.MemberDeleteAction;
import com.mypage.controller.action.MemberDeleteFormAction;
import com.mypage.controller.action.MemberEditAction;
import com.mypage.controller.action.MemberEditFormAction;
import com.mypage.controller.action.MyPageFormAction;
import com.mypage.controller.action.OrderDetailAction;
import com.mypage.controller.action.OrderListAction;
import com.notice.controller.action.NoticeCheckPassAction;
import com.notice.controller.action.NoticeCheckPassFormAction;
import com.notice.controller.action.NoticeDeleteAction;
import com.notice.controller.action.NoticeKeywordListPageAction;
import com.notice.controller.action.NoticeKeywordListPageAdminAction;
import com.notice.controller.action.NoticeListAdminPageAction;
import com.notice.controller.action.NoticeListPageAction;
import com.notice.controller.action.NoticeUpdateAction;
import com.notice.controller.action.NoticeUpdateFormAction;
import com.notice.controller.action.NoticeViewAction;
import com.notice.controller.action.NoticeViewAdminAction;
import com.notice.controller.action.NoticeWriteAction;
import com.notice.controller.action.NoticeWriteFormAction;
import com.oreilly.servlet.MultipartRequest;
import com.product.controller.action.OrderFormAction;
import com.product.controller.action.OrderInsertAction;
import com.product.controller.action.ProductAction;
import com.product.controller.action.ProductDetailAction;
// 20211011 나성현, 신정민, 위재림 command 추가 작업
// 모든 Action 집합
public class ActionFactory {
	private static ActionFactory instance = new ActionFactory();
	private ActionFactory() {
		super();
	}
	public static ActionFactory getInstance() {
		return instance;
	}
		// command 값에 따른 action 객체 생성
	public Action getAction(String command, MultipartRequest multi) {
		Action action = null;
	    System.out.println("ActionFactory  :" + command);
	    /* 추가된 부분 */
	    if (command.equals("index")) {
	      action = new IndexAction();
	    } else if (command.equals("login_form")) {
	      action = new LoginFormAction();
	    } else if (command.equals("login")) {
	      action = new LoginAction();
	    } else if (command.equals("join_form")) {
	      action = new JoinFormAction();
	    } else if (command.equals("join")) {
	      action = new JoinAction();
	    } else if (command.equals("id_check_form")) {
	      action = new IdCheckFormAction();
	    } else if (command.equals("logout")) {
	      action = new LogoutAction();
	    } else if (command.equals("id_search")) {
	      action = new IdSearchAction();
	    } else if (command.equals("pw_search")) {
	      action = new PwSearchAction();
	    } else if (command.equals("pw_change_form")) {
	      action = new PwChangeFormAction();
	    } else if (command.equals("pw_change")) {
	        action = new PwChangeAction();
	    } else if (command.equals("member_edit_form")) {
			action = new MemberEditFormAction();
		} else if (command.equals("member_edit")) {
			action = new MemberEditAction();
		} else if (command.equals("member_delete_form")) {
			action = new MemberDeleteFormAction();
		} else if (command.equals("member_delete")) {
			action = new MemberDeleteAction();
		} else if (command.equals("mypage_form")) {
	      action = new MyPageFormAction();
	    } else if (command.equals("product")) {
	      action = new ProductAction();
	    } else if (command.equals("product_detail")) {
	      action = new ProductDetailAction();
	    } else if (command.equals("order")) {
	      action = new OrderFormAction();
	    } else if(command.equals("board_list")) {
			action = new BoardListPageAction();
		} else if(command.equals("board_write_form")) {
			action = new BoardWriteFormAction();
		} else if(command.equals("board_write")){
			action  = new BoardWriteAction(multi);
		} else if(command.equals("board_check_pass_form")) {
			action  = new BoardCheckPassFormAction();
		} else if(command.equals("board_check_pass")) {
			action  = new BoardCheckPassAction();
		} else if(command.equals("board_delete")) {
			action  = new BoardDeleteAction();
		} else if(command.equals("board_view")) {
			action  = new BoardViewAction();
		} else if(command.equals("board_search")) {
			action = new BoardKeywordListPageAction();
		} else if(command.equals("board_update_form")) {
			action = new BoardUpdateFormAction();
		} else if(command.equals("board_update")) {
			action = new BoardUpdateAction(multi);
		} else if(command.equals("notice_list")) {
			action = new NoticeListPageAction();
		} else if(command.equals("notice_view")) {
			action = new NoticeViewAction();
		} else if(command.equals("notice_listAdmin")) {
			action = new NoticeListAdminPageAction();
		} else if(command.equals("notice_viewAdmin")) {
			action = new NoticeViewAdminAction();
		} else if(command.equals("notice_write_form")) {
			action = new NoticeWriteFormAction();
		} else if(command.equals("notice_write")) {
			action = new NoticeWriteAction(multi);
		} else if(command.equals("notice_update_form")) {
			action = new NoticeUpdateFormAction();
		} else if(command.equals("notice_update")) {
			action = new NoticeUpdateAction(multi);
		} else if(command.equals("notice_delete")) {
			action = new NoticeDeleteAction();
		} else if(command.equals("notice_check_pass_form")) {
			action  = new NoticeCheckPassFormAction();
		} else if(command.equals("notice_check_pass")) {
			action  = new NoticeCheckPassAction();
		} else if(command.equals("notice_search")) {
			action = new NoticeKeywordListPageAction();
		} else if(command.equals("noticeAdmin_search")) {
			action = new NoticeKeywordListPageAdminAction();
		} else if(command.equals("cart_insert")) {
			action = new CartInsertAction();
		} else if(command.equals("cart_list")) {
			action = new CartListAction();
		} else if(command.equals("cart_delete")) {
			action = new CartDeleteAction();
		} else if(command.equals("order_insert")) {
			action = new OrderInsertAction();
		} else if(command.equals("order_list")) {
			action = new OrderListAction();
		} else if (command.equals("order_detail")) {
			action = new OrderDetailAction();
		}
	    return action;
	}
}
