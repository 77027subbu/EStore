/**
 * 
 */
package com.estore.commerce.order.purchase;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;

import atg.commerce.CommerceException;
import atg.commerce.order.CreditCard;
import atg.commerce.order.Order;
import atg.commerce.order.PaymentGroup;
import atg.commerce.order.purchase.CommerceIdentifierPaymentInfo;
import atg.commerce.order.purchase.PaymentGroupFormHandler;
import atg.commerce.order.purchase.PaymentGroupMapContainer;
import atg.core.util.StringUtils;
import atg.droplet.DropletException;
import atg.payment.creditcard.CreditCardTools;
import atg.service.pipeline.RunProcessException;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;

/**
 * @author Subbu
 * 
 */
public class POCPaymentGroupFormHandler extends PaymentGroupFormHandler {

	private CreditCard creditCard;

	String processBillingSuccessURL;

	String processBillingErrorURL;

	String creditCardName;

	/**
	 * @return the creditCard
	 */
	public CreditCard getCreditCard() {

		if (null == creditCard) {
			creditCard = getCreditCard(getOrder());
		}
		return creditCard;
	}

	/**
	 * @param creditCard
	 *            the creditCard to set
	 */
	public void setCreditCard(CreditCard creditCard) {
		this.creditCard = creditCard;
	}

	/**
	 * @return the processBillingSuccessURL
	 */
	public String getProcessBillingSuccessURL() {
		return processBillingSuccessURL;
	}

	/**
	 * @param processBillingSuccessURL
	 *            the processBillingSuccessURL to set
	 */
	public void setProcessBillingSuccessURL(String processBillingSuccessURL) {
		this.processBillingSuccessURL = processBillingSuccessURL;
	}

	/**
	 * @return the processBillingErrorURL
	 */
	public String getProcessBillingErrorURL() {
		return processBillingErrorURL;
	}

	/**
	 * @param processBillingErrorURL
	 *            the processBillingErrorURL to set
	 */
	public void setProcessBillingErrorURL(String processBillingErrorURL) {
		this.processBillingErrorURL = processBillingErrorURL;
	}

	/**
	 * @return the creditCardName
	 */
	public String getCreditCardName() {
		return creditCardName;
	}

	/**
	 * @param creditCardName
	 *            the creditCardName to set
	 */
	public void setCreditCardName(String creditCardName) {
		this.creditCardName = creditCardName;
	}

	public boolean handleProcessBilling(DynamoHttpServletRequest request,
			DynamoHttpServletResponse response) throws ServletException,
			IOException {

		if (isLoggingDebug()) {
			logDebug("handleProcessBilling()");
		}
		createCreditCard(request, response);

		return checkFormRedirect(getProcessBillingSuccessURL(),
				getProcessBillingErrorURL(), request, response);
	}

	/**
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void createCreditCard(DynamoHttpServletRequest request,
			DynamoHttpServletResponse response) throws ServletException,
			IOException {

		if (isLoggingDebug()) {
			logDebug("createCreditCard()");
		}

		CreditCard creditCard = getCreditCard();

		String name = getCreditCardName();

		if ((StringUtils.isEmpty(name))) {
			name = getCommerceProfileTools().getUniqueCreditCardNickname(
					creditCard, getProfile(), null);
			setCreditCardName(name);
		}

		int statusCode = CreditCardTools.verifyCreditCard(creditCard);
		if (statusCode != 0) {
			addFormException(new DropletException("Invalid Credit Card"));
			return;
		}
		
		PaymentGroupMapContainer container = getPaymentGroupMapContainer();

		container.setDefaultPaymentGroupName(name);
		container.addPaymentGroup(name, creditCard);

		// Change the cipi method.
		CommerceIdentifierPaymentInfo cipi = getCreditCardCipi();
		cipi.setPaymentMethod(name);

		applyPaymentGroups(request, response);
		
		Map parameterMap = createRepriceParameterMap();
		try {
			runProcessValidatePaymentGroups(getOrder(), getUserPricingModels(), getUserLocale(), getProfile(), parameterMap);
		} catch (RunProcessException e) {
			e.printStackTrace();
			addFormException(new DropletException(e.getMessage()));
		}
		try {
			getOrderManager().updateOrder(getOrder());
		} catch (CommerceException e) {
			e.printStackTrace();
			addFormException(new DropletException(e.getMessage()));
		}
	}

	private CommerceIdentifierPaymentInfo getCreditCardCipi() {
		if (isLoggingDebug()) {
			logDebug("getCreditCardCipi()");
		}

		return (CommerceIdentifierPaymentInfo) getCommerceIdentifierPaymentInfoContainer()
				.getAllCommerceIdentifierPaymentInfos().get(0);

	}

	/**
	 * @return the creditCard
	 */
	@SuppressWarnings("unchecked")
	public CreditCard getCreditCard(Order order) {
		if (isLoggingDebug()) {
			logDebug("getCreditCard(order)");
		}
		List<PaymentGroup> paymentGroups = order.getPaymentGroups();
		PaymentGroup pg = null;

		int numPayGroups = paymentGroups.size();

		// We are only supporting a single credit card payment group.
		// Return the first one we get.
		for (int i = 0; i < numPayGroups; i++) {
			pg = (PaymentGroup) paymentGroups.get(i);

			if (pg instanceof CreditCard) {
				return (CreditCard) pg;
			}
		}

		if (isLoggingDebug()) {
			logDebug("No Credit Card found");
		}
		return null;
	}
}
