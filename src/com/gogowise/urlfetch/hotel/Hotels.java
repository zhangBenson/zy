package com.gogowise.urlfetch.hotel;


import com.gogowise.domain.Hotel;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.Collection;

@XmlRootElement(name="Hotels")
public class Hotels{

     Collection<Hotel> hotels ;

    @XmlElement(name="Hotel")
    public Collection<Hotel> getHotels() {
        return hotels;
    }

    public void setHotels(Collection<Hotel> hotels) {
        this.hotels = hotels;
    }
}
