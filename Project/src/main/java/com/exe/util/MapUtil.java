package com.exe.util;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.exe.dto.GeocodeRequestDTO;
import com.google.code.geocoder.Geocoder;
import com.google.code.geocoder.GeocoderRequestBuilder;
import com.google.code.geocoder.model.GeocodeResponse;
import com.google.code.geocoder.model.GeocoderRequest;
import com.google.code.geocoder.model.GeocoderResult;
import com.google.code.geocoder.model.GeocoderStatus;
import com.google.code.geocoder.model.LatLng;

@Component
public class MapUtil {

	@Scheduled(fixedDelay=5000) //Ÿ�Ӿƿ�����
	public float[] geoCoding(GeocodeRequestDTO geocodeRequestdto){
		if(geocodeRequestdto.getAddress()==null) {
			return null;
		}
		
		Geocoder geocoder = new Geocoder();
		GeocoderRequest geocoderRequest =
				new GeocoderRequestBuilder().setAddress(geocodeRequestdto.getAddress()).
				setLanguage("ko").getGeocoderRequest();
		
		GeocodeResponse geocodeResponse;
	
		try {
			geocodeResponse = geocoder.geocode(geocoderRequest);
			if(geocodeResponse.getStatus()==GeocoderStatus.OK & !geocodeResponse.getResults().isEmpty()) {
				GeocoderResult geocoderResult = geocodeResponse.getResults().iterator().next();
				LatLng latitudeLongitude = geocoderResult.getGeometry().getLocation();
				
				float[] coords = new float[2];
				coords[0] = latitudeLongitude.getLat().floatValue();
				coords[1] = latitudeLongitude.getLat().floatValue();
				
				return coords;
			}
		
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return null;
	}

}
