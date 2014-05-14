/**
 * 
 */
package com.abc.poc.commerce.order.purchase;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;

import atg.commerce.CommerceException;
import atg.commerce.order.HardgoodShippingGroup;
import atg.commerce.order.purchase.CommerceItemShippingInfo;
import atg.commerce.order.purchase.ShippingGroupFormHandler;
import atg.core.util.ContactInfo;
import atg.droplet.DropletException;
import atg.service.pipeline.RunProcessException;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;

/**
 * @author Madhulal
 * 
 */
public class POCShippingGroupFormHandler extends ShippingGroupFormHandler {

	ContactInfo shippingAddress;

	String processShippingSuccessURL;

	String processShippingErrorURL;

	String shippingMethod;

	/**
	 * @return the shippingAddress
	 */
	public ContactInfo getShippingAddress() {
		if (shippingAddress == null) {
			shippingAddress = new ContactInfo();
		}

		return shippingAddress;
	}

	/**
	 * @param shippingAddress
	 *            the shippingAddress to set
	 */
	public void setShippingAddress(ContactInfo shippingAddress) {
		this.shippingAddress = shippingAddress;
	}

	/**
	 * @return the processShippingSuccessURL
	 */
	public String getProcessShippingSuccessURL() {
		return processShippingSuccessURL;
	}

	/**
	 * @param processShippingSuccessURL
	 *            the processShippingSuccessURL to set
	 */
	public void setProcessShippingSuccessURL(String processShippingSuccessURL) {
		this.processShippingSuccessURL = processShippingSuccessURL;
	}

	/**
	 * @return the processShippingErrorURL
	 */
	public String getProcessShippingErrorURL() {
		return processShippingErrorURL;
	}

	/**
	 * @param processShippingErrorURL
	 *            the processShippingErrorURL to set
	 */
	public void setProcessShippingErrorURL(String processShippingErrorURL) {
		this.processShippingErrorURL = processShippingErrorURL;
	}

	/**
	 * @return the shippingMethod
	 */
	public String getShippingMethod() {
		return shippingMethod;
	}

	/**
	 * @param shippingMethod
	 *            the shippingMethod to set
	 */
	public void setShippingMethod(String shippingMethod) {
		this.shippingMethod = shippingMethod;
	}

	public boolean handleProcessShipping(DynamoHttpServletRequest pRequest,
			DynamoHttpServletResponse pResponse) throws ServletException,
			IOException, RunProcessException {

		// TODO validate address

		// Here we have only one address to ship.
		shiptoNewAddress(pRequest, pResponse);

		// Now if we want to ship to multiple address, we need to begin

		return checkFormRedirect(getProcessShippingSuccessURL(),
				getProcessShippingSuccessURL(), pRequest, pResponse);
	}

	/**
	 * This method is used to handle the new address scenario
	 * 
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * @throws RunProcessException 
	 */
	public void shiptoNewAddress(DynamoHttpServletRequest request,
			DynamoHttpServletResponse response) throws ServletException,
			IOException, RunProcessException {

		if (isLoggingDebug()) {
			logDebug("shipToNewAddress()");
		}

		HardgoodShippingGroup hardgoodSG = null;

		// TODO change to dynamically generate or get it from the user
		String newShipToAddressName = "Shipping Address";

		try {
			// Create a new shipping group
			hardgoodSG = (HardgoodShippingGroup) getShippingGroupManager()
					.createShippingGroup();
		} catch (CommerceException e) {
			if (isLoggingError()) {
				logError("A CommerceException while creating new SG");
			}
			e.printStackTrace();
			addFormException(new DropletException(
					"CommerceException in creating SG"));
			return;
		}

		// Set the address
		hardgoodSG.setShippingAddress(getShippingAddress());

		// put the new shipping group in the container
		getShippingGroupMapContainer().addShippingGroup(newShipToAddressName,
				hardgoodSG);

		// Get all the cisi from the container
		Iterator commerceItemShippingInfoerator = getAllHardgoodCommerceItemShippingInfos()
				.iterator();

		// Since there is only one SG, set the name of the shipping group to the
		// name we have given.
		while (commerceItemShippingInfoerator.hasNext()) {
			CommerceItemShippingInfo cisi = (CommerceItemShippingInfo) commerceItemShippingInfoerator
					.next();

			if (newShipToAddressName != null) {
				cisi.setShippingGroupName(newShipToAddressName);
			}
		}

		applyShippingGroups(request, response);
		
		try {
			getOrderManager().updateOrder(getOrder());
		} catch (CommerceException e) {
			e.printStackTrace();
			addFormException(new DropletException(e.getMessage()));
		}

	}

}
