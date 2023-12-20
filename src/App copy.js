import logo from './logo.svg';
import './App.css';
import "leaflet/dist/leaflet.css";
import L from 'leaflet';
import React from 'react';
import { MapContainer, Marker, Polygon, Popup, TileLayer, useMap } from 'react-leaflet'
import iconMarker from 'leaflet/dist/images/marker-icon.png'
import iconRetina from 'leaflet/dist/images/marker-icon-2x.png'
import iconShadow from 'leaflet/dist/images/marker-shadow.png'
import { MarkerLayer } from 'react-leaflet-marker';
import { useEffect, useState } from 'react';
import axios from 'axios';


function Leaf() {
  const position = [5.5912087,-0.1797294]
  const position2 = [5.0, -1.7]
  const [markers, setMarkers] = useState([]);
  function LocationMarkers() {
    
    return (
      <React.Fragment>
        {markers.map(marker => <Marker position={[marker.latitude,marker.longitude]} icon={icon} >      <Popup>{marker.timeAdded}</Popup>
</Marker>)}
      </React.Fragment>
    );
  }
 
  
      useEffect(()=>{ 
        const fetchLast =async()=>{
          try{
              await axios.get('http://149.102.145.130:8090/markers').then((res)=>{
            setMarkers(res.data);
            console.log(res.data);
            
            });
            
          }catch (error){
          console.log(error);
          
            }
           
            }  
        fetchLast();
      },[]);
      
  const coords =[
    {lat: 24.9946436,lng: 87.20163200000002},
    {lat: 28.7041, lng: 77.1025},
    {lat: 23.4567, lng: 75.2345}
    
  ]

  const icon = L.icon({ 
    iconRetinaUrl:iconRetina, 
    iconUrl: iconMarker, 
  
    iconSize:[15,20]
});
  
  return (


    <div className="App">
      
        <MapContainer center={position} zoom={10} scrollWheelZoom={true}    style={{ height:"800px",backgroundColor:"red"}}
>
    <TileLayer
      attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
      url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
    />
            <MarkerLayer>

    <LocationMarkers></LocationMarkers>
</MarkerLayer>
    
    <Polygon color={'green'} positions={coords} />

  </MapContainer>

    </div>
  );
}

export default Leaf;
