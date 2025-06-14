package cn.techtutorial.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.techtutorial.model.Cart;

@WebServlet(name = "AddToCartServlet", urlPatterns = "/add-to-cart")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private String productCode;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		int id = Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession();
		ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");

		if (cart_list == null) {
			cart_list = new ArrayList<>();
			Cart cm = new Cart();
                    String productCode = null;
			cm.setProductCode(productCode);
			cm.setQuantity(1);
			cart_list.add(cm);
			session.setAttribute("cart-list", cart_list);
		} else {
			boolean exist = false;
			for (Cart c : cart_list) {
				if (c.getProductCode() == productCode()) {
					exist = true;
					c.setQuantity(c.getQuantity() + 1);
					break;
				}
			}
			if (!exist) {
				Cart cm = new Cart();
				cm.setProductCode(productCode);
				cm.setQuantity(1);
				cart_list.add(cm);
			}
		}
		response.sendRedirect("cart.jsp");
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response); // redirect GET to POST if needed
	}

    private String productCode() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
 
