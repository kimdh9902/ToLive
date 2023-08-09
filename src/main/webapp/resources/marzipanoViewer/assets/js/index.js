/*
 * Copyright 2016 Google Inc. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
"use strict";

(function() {
  var Marzipano = window.Marzipano;
  var bowser = window.bowser;
  var screenfull = window.screenfull;
  var data = window.APP_DATA;

  // Grab elements from DOM.
  var panoElement = document.querySelector("#pano");
  var sceneNameElement = document.querySelector("#titleBar .sceneName");
  var sceneListElement = document.querySelector("#sceneList");
  var sceneElements = document.querySelectorAll("#sceneList .scene");
  var sceneListToggleElement = document.querySelector("#sceneListToggle");
  var autorotateToggleElement = document.querySelector("#autorotateToggle");
  var fullscreenToggleElement = document.querySelector("#fullscreenToggle");


  // Detect desktop or mobile mode.
  if (window.matchMedia) {
    var setMode = function() {
      if (mql.matches) {
       document.body.classList.remove("desktop");
        document.body.classList.add("mobile");
      } else {
        document.body.classList.remove("mobile");
        document.body.classList.add("desktop");
      }
    };
    var mql = matchMedia("(max-width: 500px), (max-height: 500px)");
    setMode();
    mql.addListener(setMode);
  } else {
    document.body.classList.add("desktop");
  }



  // Detect whether we are on a touch device.
  	document.body.classList.add("no-touch");
  window.addEventListener("touchstart", function() {
	document.body.classList.remove("no-touch");
	document.body.classList.add("touch");
  });

  // Use tooltip fallback mode on IE < 11.
  if (bowser.msie && parseFloat(bowser.version) < 11) {
    document.body.classList.add("tooltip-fallback");
  }

  // Viewer options.
  var viewerOpts = {
    controls: {
      mouseViewMode: data.settings.mouseViewMode
    }
  };

  // Initialize viewer.
  var viewer = new Marzipano.Viewer(panoElement, viewerOpts);
  let nearbyRoad = data.scenes;
  var defaultLinkHotspots = data.defaultLinkHotspots;
  var levels = data.levels;
  var faceSize = data.faceSize;
  var initialViewParameters = data.initialViewParameters;
  var scenes = [];
  var pointIdx;

  // Get contextPath 
  function getContextPath(){
  	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
  	var contextPath = location.href.substring( hostIndex, location.href.indexOf
  		('/', hostIndex + 1 ) );
  	return contextPath;
  	}
  	
  

  // Create scenes.
  function createScenes(startIdx, endIdx) {
    let tempScenes = nearbyRoad.slice(startIdx, endIdx).map(function(data, i) {
      data.levels = levels;
      data.initialViewParameters = initialViewParameters;
      data.faceSize = faceSize;

	  var contextPath = getContextPath();
	  var urlPrefix = contextPath + "/resources/TripToLive/board_contents/" + folderPath + "/tiles";
      // var urlPrefix = "/ToLive/resources/marzipanoViewer/tiles";
      var source = Marzipano.ImageUrlSource.fromString(urlPrefix + "/" + data.id + "/{z}/{f}/{y}/{x}.jpg", {
        cubeMapPreviewUrl: urlPrefix + "/" + data.id + "/preview.jpg"
      });
      var geometry = new Marzipano.CubeGeometry(data.levels);

      var limiter = Marzipano.RectilinearView.limit.traditional(
        data.faceSize,
        (100 * Math.PI) / 180,
        (120 * Math.PI) / 180
      );
      var view = new Marzipano.RectilinearView(data.initialViewParameters, limiter);

      var scene = viewer.createScene({
        source: source,
        geometry: geometry,
        view: view,
        pinFirstLevel: true
      });
	
      if(!(defaultLinkHotspots == undefined)){
      if (data.linkHotspots && data.linkHotspots.length === 2) {
        let newHotspots = [];
        data.linkHotspots.forEach(hotspot => {
          let newHotspot = {
            yaw: hotspot.yaw,
            pitch: hotspot.pitch,
            rotation: hotspot.rotation
          };
          newHotspots.push(newHotspot);
        });
        defaultLinkHotspots = newHotspots.slice();
      }
    }
      pointIdx = nearbyRoad.findIndex(scene => scene.id === data.id);

      if (data.linkHotspots.length === 0) {
        // NEXT ARROW TARGET
        let nextTarget;
        if (nearbyRoad[pointIdx + 1]) {
          nextTarget = nearbyRoad[pointIdx + 1].id;
        }
        if(!(defaultLinkHotspots == undefined)){
        let nextHotspot = {
          ...defaultLinkHotspots[0],
          target: nextTarget
        };
        data.linkHotspots.push(nextHotspot);
      }
        // PREVIOUS ARROW TARGET
        let prevTarget;
        if (nearbyRoad[pointIdx - 1]) {
          prevTarget = nearbyRoad[pointIdx - 1].id;
        }
        if(!(defaultLinkHotspots == undefined)){
        let prevHotspot = {
          ...defaultLinkHotspots[1],
          target: prevTarget
        };
        data.linkHotspots.push(prevHotspot);
      }
      }

      // NEXT ARROW SIGN
      let nt = data.linkHotspots[0] ? data.linkHotspots[0].target : null;
      if (nearbyRoad[pointIdx + 1] || nt) {
        var nextElement = createLinkHotspotElement(data.linkHotspots[0]);
        scene
          .hotspotContainer()
          .createHotspot(nextElement, { yaw: data.linkHotspots[0].yaw, pitch: data.linkHotspots[0].pitch });
      }
      // PREV ARROW SIGN
      let pt = data.linkHotspots[1] ? data.linkHotspots[1].target : null;
      if (nearbyRoad[pointIdx - 1] || pt) {
        var prevElement = createLinkHotspotElement(data.linkHotspots[1]);
        scene
          .hotspotContainer()
          .createHotspot(prevElement, { yaw: data.linkHotspots[1].yaw, pitch: data.linkHotspots[1].pitch });
      }

      // FOR MORE THAN 2 ARROW SIGN
      if (data.linkHotspots.length > 2) {
        for (let i = 2; i < data.linkHotspots.length; i++) {
          var element = createLinkHotspotElement(data.linkHotspots[i]);
          scene
            .hotspotContainer()
            .createHotspot(element, { yaw: data.linkHotspots[i].yaw, pitch: data.linkHotspots[i].pitch });
        }
      }

      return {
        data: data,
        scene: scene,
        view: view
      };
    });
    tempScenes.forEach(tempScene => {
      let idx = scenes.findIndex(scene => scene.data.id === tempScene.data.id);
      if (idx === -1) {
        scenes.push(tempScene);
      }
    });
  }

  createScenes(0, 2);

  function sanitize(s) {
    return s
      .replace("&", "&amp;")
      .replace("<", "&lt;")
      .replace(">", "&gt;");
  }

  function switchScene(scene) {
    scene.view.setParameters((viewer.view() && viewer.view().parameters()) || scene.data.initialViewParameters);
    scene.scene.switchTo();
  }

  function updateSceneName(scene) {
    sceneNameElement.innerHTML = sanitize(scene.data.name);
  }

  function createLinkHotspotElement(hotspot) {
    // Create wrapper element to hold icon and tooltip.
    var wrapper = document.createElement("div");
    wrapper.classList.add("hotspot");
    wrapper.classList.add("link-hotspot");

    // Create image element.
    var icon = document.createElement("img");
    icon.src = "/ToLive/resources/marzipanoViewer/img/link.png";
    icon.classList.add("link-hotspot-icon");

    // Set rotation transform.
    // var transformProperties = ["-ms-transform", "-webkit-transform", "transform"];
    // for (var i = 0; i < transformProperties.length; i++) {
    //   var property = transformProperties[i];
    //   icon.style[property] = "rotate(" + hotspot.rotation + "rad)";
    // }

    // Add click event handler.
    wrapper.addEventListener("click", function() {
      console.log(hotspot.target);
      switchScene(findSceneById(hotspot.target));

      let targetIdx = nearbyRoad.findIndex(scene => scene.id === hotspot.target);

      if (nearbyRoad[targetIdx + 1] && !findSceneById(nearbyRoad[targetIdx + 1].id)) {
        targetIdx = targetIdx + 1;
      } else if (nearbyRoad[targetIdx - 1] && !findSceneById(nearbyRoad[targetIdx - 1].id)) {
        targetIdx = targetIdx - 1;
      }

      if (targetIdx > pointIdx) {
        createScenes(targetIdx, targetIdx + 1);
      } else if (targetIdx < pointIdx) {
        createScenes(targetIdx, targetIdx + 1);
      }
    });

    // Prevent touch and scroll events from reaching the parent element.
    // This prevents the view control logic from interfering with the hotspot.
    stopTouchAndScrollEventPropagation(wrapper);

    // Create tooltip element.
    var tooltip = document.createElement("div");
    tooltip.classList.add("hotspot-tooltip");
    tooltip.classList.add("link-hotspot-tooltip");
    // tooltip.innerHTML = findSceneDataById(hotspot.target).name;

    wrapper.appendChild(icon);
    wrapper.appendChild(tooltip);

    return wrapper;
  }

  // Prevent touch and scroll events from reaching the parent element.
  function stopTouchAndScrollEventPropagation(element, eventList) {
    var eventList = ["touchstart", "touchmove", "touchend", "touchcancel", "wheel", "mousewheel"];
    for (var i = 0; i < eventList.length; i++) {
      element.addEventListener(eventList[i], function(event) {
        event.stopPropagation();
      });
    }
  }

  function findSceneById(id) {
    for (var i = 0; i < scenes.length; i++) {
      if (scenes[i].data.id === id) {
        return scenes[i];
      }
    }
    return null;
  }

  function findSceneDataById(id) {
    for (var i = 0; i < data.scenes.length; i++) {
      if (data.scenes[i].id === id) {
        return data.scenes[i];
      }
    }
    return null;
  }

  // Display the initial scene.
  switchScene(scenes[0]);
})();
