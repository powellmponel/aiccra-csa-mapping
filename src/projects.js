import logo from './logo.svg';
import './App.css';
import "leaflet/dist/leaflet.css";
import k from "./ghana_regions.json"
import L from 'leaflet';
import React from 'react';
import { MapContainer, Marker, Polygon, Popup, TileLayer, useMap,GeoJSON} from 'react-leaflet'
import iconMarker from 'leaflet/dist/images/marker-icon.png'
import iconRetina from 'leaflet/dist/images/marker-icon-2x.png'
import { MarkerLayer } from 'react-leaflet-marker';
import { useEffect, useState } from 'react';
import axios from 'axios';
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';


function Projects() {
  const position = [8.648,-0.813]
  const position2 = [5.0, -1.7]
  const [markers, setMarkers] = useState('');
  const [search, setSearch] = useState('');

  const [show, setShow] = useState(true);

  const handleClose = () => setShow(false);
  const handleShow = () => setShow(true);
 
  function StaticExample() {
    return (
      <div
        className="modal show"
        style={{ display: 'block', position: 'initial' }}
      >
         <Modal show={show} onHide={handleClose}>
        <Modal.Header closeButton>
          <Modal.Title>Modal heading</Modal.Title>
        </Modal.Header>
        <Modal.Body>Woohoo, you are reading this text in a modal!</Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={handleClose}>
            Close
          </Button>
          <Button variant="primary" onClick={handleClose}>
            Save Changes
          </Button>
        </Modal.Footer>
      </Modal>
    
      </div>
    );
  }
  
     

      useEffect(()=>{ 
        const fetchLast =async()=>{
          try{
              await axios.get('http://localhost:9090/v1/api/get/by/region?region='+search).then((res)=>{

             var projects= res.data.map((e)=>{ return e.projectName});

              setMarkers(projects);
            alert(projects);
            
            });
            
          }catch (error){
          console.log(error);
          
            }
           
            }  
        fetchLast();
      },[search]);
      
  
  const icon = L.icon({ 
    iconRetinaUrl:iconRetina, 
    iconUrl: iconMarker, 
  
    iconSize:[15,20]
});

function onEachFeature(feature, layer) {
  //bind click
  layer.on({
      click: ()=>{whenClicked(feature.properties.region)}
  });
  layer.bindPopup('<p>'+feature.properties.region+'</p>');
}

function whenClicked(e) {
  // e = event
  //alert(e);
  setSearch(e);

  // You can make your ajax call declaration here
  //$.ajax(... 
}


  
  return (


    <div className="App">
      
        <MapContainer center={position} zoom={7.5} scrollWheelZoom={true}    style={{ height:"800px",backgroundColor:"red"}}
>
    <TileLayer
      attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
      url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
    />
            <MarkerLayer>

 
</MarkerLayer>
    
    <GeoJSON data={k}        onclick={(e)=>(alert(e))}      onEachFeature={ onEachFeature}/>

  </MapContainer>

    </div>
  );
}

export default Projects;
