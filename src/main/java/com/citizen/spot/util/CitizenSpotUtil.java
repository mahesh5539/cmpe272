package com.citizen.spot.util;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import org.apache.log4j.Logger;

public class CitizenSpotUtil {
	
	private static Logger logger = Logger.getLogger(CitizenSpotUtil.class);
    private static final DecimalFormat timeFormat4 = new DecimalFormat("0000;0000");

    public static String getUUID() {
        Calendar cal = Calendar.getInstance();
        String val = String.valueOf(cal.get(Calendar.YEAR));
        val += timeFormat4.format(cal.get(Calendar.DAY_OF_YEAR));
        val += UUID.randomUUID().toString().replaceAll("-", "");
        return val;
    }

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println(getUUID());
	}
}
