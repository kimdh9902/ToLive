<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Marzipano Tool</title>
  <link rel="icon" type="image/png" href="${ pageContext.servletContext.contextPath }/resources/marzipanoTool/assets/img/favicon.png" />
  <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/marzipanoTool/assets/css/app.css">
  <meta name="viewport" content="target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, minimal-ui" />

  <script type="x-worker-zip" src="${ pageContext.servletContext.contextPath }/resources/marzipanoTool/assets/js/zip.worker.js"></script>
  <script type="x-worker-cube" src="${ pageContext.servletContext.contextPath }/resources/marzipanoTool/assets/js/cube.worker.js"></script>
  <script type="x-worker-equirect" src="${ pageContext.servletContext.contextPath }/resources/marzipanoTool/assets/js/equirect.worker.js"></script>

  <svg style="display: none">

    <symbol id="up" viewBox="0 0 57.852 30">
      <path d="M0,30L28.927,0l28.925,30H0z"/>
    </symbol>

    <symbol id="down" viewBox="0 0 57.852 30">
      <path d="M57.852,0L28.927,30L0,0H57.852z"/>
    </symbol>

    <symbol id="expand" viewBox="0 0 41.975 30">
      <path d="M26.421,0l15.554,14.999L26.421,30V0z"/>
      <path d="M0,1.111v4.665h22.218V1.111H0z M0,17.802h22.218v-4.666H0V17.802z M0,28.888h22.218v-4.667H0V28.888z"/>
    </symbol>

    <symbol id="collapse" viewBox="0 0 41.975 30">
      <path d="M15.554,30L0,14.999L15.554,0V30z"/>
      <path d="M19.757,1.111v4.665h22.218V1.111H19.757z M41.975,13.136H19.757v4.666h22.218V13.136z M41.975,24.221H19.757v4.667h22.218V24.221z"/>
    </symbol>

    <symbol id="enable" viewBox="0 0 30 30">
      <path d="M15,0c8.283,0,15,6.715,15,15c0,8.283-6.717,15-15,15C6.715,30,0,23.283,0,15C0,6.715,6.715,0,15,0z"/>
    </symbol>

    <symbol id="disable" viewBox="0 0 31 31">
      <path d="M15.5,31C6.953,31,0,24.047,0,15.5S6.953,0,15.5,0S31,6.953,31,15.5S24.047,31,15.5,31z M15.5,1C7.505,1,1,7.505,1,15.5S7.505,30,15.5,30S30,23.495,30,15.5S23.495,1,15.5,1z"/>
    </symbol>

    <symbol id="handle" viewBox="0.869 0.25 29.264 30">
      <path d="M0.869,0.25v2.484h29.264V0.25H0.869z M0.869,12.026h29.264V9.542H0.869V12.026z M0.869,21.468h29.264v-2.482H0.869V21.468zM0.869,30.25h29.264v-2.483H0.869V30.25z"/>
    </symbol>

    <symbol id="pencil" viewBox="0 0 30 30">
      <path d="M29.775,7.784l-7.565-7.57c-0.285-0.285-0.744-0.285-1.029,0l-4.333,4.338l8.595,8.597l4.333-4.335C30.06,8.531,30.06,8.068,29.775,7.784z M9.203,21.583c-0.323,0.324-0.847,0.324-1.171,0c-0.32-0.323-0.32-0.847,0-1.17L18.906,9.535l-3.519-3.521l-13.21,13.22c-0.375,0.374-0.65,0.847-0.733,1.337L0.04,28.524c-0.171,0.972,0.477,1.62,1.446,1.448l7.949-1.407c0.486-0.083,0.961-0.356,1.336-0.73L23.98,14.61l-3.905-3.905L9.203,21.583z M5.639,26.517l-2.145-2.147l0.408-2.309l4.041,4.048L5.639,26.517z"/>
    </symbol>

    <symbol id="eye" viewBox="0 0 44.239 30">
      <path d="M43.843,13.778c-0.183-0.254-4.56-6.309-10.604-10.445C30.109,1.182,26.161,0,22.12,0c-4.037,0-7.988,1.182-11.126,3.333C4.951,7.469,0.579,13.524,0.396,13.778c-0.526,0.734-0.526,1.709,0,2.443c0.184,0.256,4.557,6.312,10.599,10.445C14.132,28.814,18.083,30,22.12,30c4.042,0,7.99-1.186,11.12-3.333c6.044-4.14,10.421-10.19,10.604-10.444C44.373,15.488,44.373,14.51,43.843,13.778z M22.12,22.499c-4.278,0-7.743-3.365-7.743-7.499c0-4.145,3.464-7.501,7.743-7.501c4.269,0,7.742,3.357,7.742,7.501C29.863,19.134,26.389,22.499,22.12,22.499z M22.12,10.713c-2.445,0-4.426,1.918-4.426,4.287c0,2.359,1.979,4.284,4.426,4.284c2.437,0,4.424-1.925,4.424-4.284C26.544,12.632,24.557,10.713,22.12,10.713z"/>
    </symbol>

    <symbol id="trash" viewBox="0 0 22.784 30">
      <path d="M2.674,28.555C2.708,29.363,3.387,30,4.211,30h14.363c0.822,0,1.502-0.637,1.535-1.445l1.025-21.25H1.648L2.674,28.555zM14.641,12.583c0-0.338,0.281-0.613,0.625-0.613h1c0.346,0,0.625,0.275,0.625,0.613v12.14c0,0.338-0.279,0.613-0.625,0.613h-1c-0.344,0-0.625-0.275-0.625-0.613V12.583z M10.267,12.583c0-0.338,0.28-0.613,0.625-0.613h1c0.347,0,0.625,0.275,0.625,0.613v12.14c0,0.338-0.278,0.613-0.625,0.613h-1c-0.345,0-0.625-0.275-0.625-0.613V12.583z M5.894,12.583c0-0.338,0.28-0.613,0.625-0.613h0.999c0.346,0,0.625,0.275,0.625,0.613v12.14c0,0.338-0.279,0.613-0.625,0.613H6.519c-0.345,0-0.625-0.275-0.625-0.613V12.583zM21.818,1.545h-6.625v-1.23C15.194,0.143,15.048,0,14.87,0H7.913C7.735,0,7.591,0.143,7.591,0.315v1.23H0.965C0.432,1.545,0,1.971,0,2.494v2.975h22.784V2.494C22.784,1.971,22.354,1.545,21.818,1.545z"/>
    </symbol>

    <symbol id="hourglass" viewBox="0 0 22.484 30">
      <path d="M21.029,25.85v-2.996c0-4.059-4.53-6.625-7.426-7.853c2.896-1.229,7.426-3.797,7.426-7.855V4.151c0.878-0.405,1.455-1.099,1.455-1.883C22.484,1.016,21.021,0,19.214,0H3.271C1.465,0,0,1.016,0,2.268c0,0.784,0.577,1.478,1.454,1.883v2.996c0,4.058,4.532,6.626,7.428,7.855c-2.896,1.229-7.428,3.794-7.428,7.852v2.996C0.577,26.257,0,26.948,0,27.734C0,28.984,1.465,30,3.271,30h15.942c1.807,0,3.271-1.016,3.271-2.266C22.484,26.948,21.907,26.257,21.029,25.85z M5.103,7.146V4.732c0-0.398,0.409-0.72,0.912-0.72h10.456c0.502,0,0.912,0.322,0.912,0.72v2.415c0,2.696-3.851,4.617-5.506,5.318l-0.203,0.088c-0.135,0.056-0.283,0.085-0.432,0.085c-0.147,0-0.297-0.029-0.431-0.085l-0.203-0.088C8.953,11.764,5.103,9.842,5.103,7.146z M17.383,25.271c0,0.396-0.41,0.718-0.912,0.718H6.015c-0.503,0-0.912-0.322-0.912-0.718v-2.418c0-2.692,3.851-4.617,5.506-5.317l0.202-0.085c0.27-0.115,0.594-0.115,0.864,0l0.203,0.085c1.653,0.7,5.506,2.625,5.506,5.317L17.383,25.271L17.383,25.271z M11.242,19.799c-2.636,1.296-4.224,2.732-4.224,3.87v0.884h8.448v-0.884C15.466,22.531,13.879,21.095,11.242,19.799z M14.189,8.807V8.189H8.295v0.618c0,0.792,1.107,1.795,2.947,2.698C13.081,10.602,14.189,9.598,14.189,8.807z"/>
    </symbol>

    <symbol id="flask" viewBox="0 0 30 30">
      <path d="M14.934,17.896c0,0.863,0.705,1.562,1.572,1.562c0.873,0,1.578-0.699,1.578-1.562c0-0.861-0.705-1.557-1.578-1.557C15.639,16.338,14.934,17.035,14.934,17.896z M12.009,15.536c-0.847,0-1.533,0.68-1.533,1.518c0,0.84,0.686,1.52,1.533,1.52s1.533-0.68,1.533-1.52C13.542,16.216,12.855,15.536,12.009,15.536z M16.326,14.376c0-0.615-0.501-1.113-1.122-1.113c-0.621,0-1.124,0.498-1.124,1.113s0.503,1.115,1.124,1.115C15.825,15.492,16.326,14.992,16.326,14.376z M28.282,24.596c0,0-3.753-6.916-9.869-16.869V1.962h0.379c0.544,0,0.99-0.439,0.99-0.981S19.336,0,18.792,0H9.836C9.288,0,8.845,0.442,8.844,0.981c0,0.542,0.444,0.981,0.993,0.981h0.378v5.763C4.094,17.68,0.34,24.614,0.34,24.614C-0.613,27.42,0.438,30,3.484,30h21.654C28.188,30,29.235,27.402,28.282,24.596z M5.073,20.517c0.637-1.076,5.335-9.21,6.896-11.75l0.24-0.394h4.207l0.238,0.394c1.437,2.332,5.886,9.967,6.876,11.75H5.073z"/>
    </symbol>

    <symbol id="check" viewBox="0 0 37.47 29.999">
      <path d="M36.078,0.828c-1.566-1.245-3.825-1.065-5.039,0.398l-16.031,19.31L6.641,9.912C5.393,8.328,3.066,8.033,1.446,9.25c-1.623,1.218-1.925,3.492-0.677,5.078L12,28.587c1.248,1.584,3.574,1.881,5.195,0.662c0.464-0.349,0.805-0.787,1.048-1.267L36.717,5.728C37.932,4.264,37.646,2.071,36.078,0.828z"/>
    </symbol>

    <symbol id="cross" viewBox="0 0 30 30">
      <path d="M17.463,15L29.44,3.007c0.686-0.688,0.686-1.803,0-2.49c-0.685-0.688-1.797-0.688-2.485,0L14.979,12.512L3,0.517c-0.685-0.688-1.8-0.688-2.486,0c-0.686,0.688-0.686,1.802,0,2.49L12.493,15L0.514,26.995c-0.686,0.688-0.686,1.802,0,2.49C0.858,29.828,1.309,30,1.757,30c0.45,0,0.9-0.173,1.244-0.516L14.977,17.49l11.977,11.995C27.298,29.828,27.747,30,28.197,30c0.449,0,0.898-0.173,1.241-0.516c0.688-0.688,0.688-1.802,0-2.49L17.463,15z"/>
    </symbol>

    <symbol id="shutter" viewBox="0 0 30 30">
      <path d="M11.1,12.75L18.3,0.3C17.25,0.15,16.049,0,15,0c-3.6,0-6.9,1.201-9.45,3.451L11.1,12.9V12.75z M29.25,10.5C27.9,6.15,24.6,2.55,20.25,1.05L14.85,10.5H29.25z M29.699,12h-11.25l0.452,0.75l7.2,12.45C28.5,22.5,30,18.9,30,15C30,13.95,29.851,12.9,29.699,12z M9.75,15L3.9,4.8C1.5,7.5,0,11.1,0,15c0,1.05,0.15,2.1,0.3,3h11.25L9.75,15z M0.75,19.5c1.351,4.35,4.65,7.95,9,9.45l5.55-9.45H0.75L0.75,19.5z M17.548,19.5l-5.849,10.2C12.75,30,13.799,30,15,30c3.601,0,6.899-1.2,9.45-3.45l-5.549-9.45L17.548,19.5z"/>
    </symbol>

    <symbol id="gallery" viewBox="0 0 39.434 30">
      <path d="M4.929,5v25h34.504V5H4.929z M36.969,25.833L32.04,17.5l-5.587,4.723L22.182,15L7.394,27.5v-20h29.575V25.833z M9.859,13.75c0,2.07,1.655,3.75,3.696,3.75c2.041,0,3.697-1.68,3.697-3.75c0-2.072-1.656-3.75-3.697-3.75C11.514,10,9.859,11.679,9.859,13.75zM34.504,0H0v25h2.465V2.5h32.039V0z"/>
    </symbol>

    <symbol id="upload" viewBox="0 0 47.721 30">
      <path d="M40.579,12.169c-0.142-0.934-0.378-1.86-0.711-2.773C37.818,3.777,32.398,0,26.378,0c-1.661,0-3.304,0.288-4.879,0.855c-3.868,1.39-6.948,4.388-8.454,8.155c-0.452-0.045-0.902-0.07-1.351-0.07C5.245,8.939,0,13.641,0,19.418c0,5.436,4.39,9.815,10.438,10.409l1.707,0.14v-0.16H36.98V30l1.688-0.147c5.245-0.457,9.054-4.25,9.054-9.022C47.721,16.816,44.782,13.329,40.579,12.169z M38.882,26.724H10.592l-0.144,0.002c-4.272-0.541-7.343-3.574-7.343-7.308c0-4.076,3.852-7.394,8.589-7.394c0.687,0,1.384,0.073,2.076,0.218l1.412,0.297l0.402-1.378c0.995-3.426,3.602-6.194,6.971-7.407c1.235-0.445,2.523-0.671,3.824-0.671c4.716,0,8.965,2.96,10.567,7.362c0.372,1.017,0.595,2.056,0.658,3.086l0.081,1.224l1.219,0.2c3.312,0.543,5.714,3.016,5.714,5.877C44.617,23.87,42.284,26.241,38.882,26.724z"/>
      <path d="M30.329,15.958l-5.973-5.421c-0.239-0.205-0.518-0.308-0.836-0.308c-0.325,0-0.601,0.103-0.827,0.308l-5.981,5.421c-0.232,0.211-0.349,0.464-0.349,0.759c0,0.3,0.117,0.55,0.349,0.749l0.689,0.625c0.221,0.21,0.496,0.316,0.827,0.316s0.606-0.106,0.828-0.316l4.465-4.04l4.466,4.04c0.221,0.21,0.495,0.316,0.826,0.316c0.324,0,0.604-0.106,0.837-0.316l0.688-0.625c0.226-0.206,0.341-0.455,0.341-0.749C30.678,16.423,30.561,16.17,30.329,15.958z"/>
    </symbol>

    <symbol id="export" viewBox="0 0 33 30">
      <path d="M23.391,22c-1.781-0.027-1.752,0.515-1.752,0.874v4.374H3.534V2.75h18.104v4.375c0,0,0.476,0.088,1.704,0.12c0.354,0.009,0.922-0.12,0.922-0.12v-7l-23.354,0v29.75l23.354-0.002v-6.999C24.265,22.515,23.747,22.004,23.391,22z M31.501,13.982l-4.347-4.484c-0.303-0.313-0.796-0.313-1.099,0c-0.304,0.314-0.304,0.822,0,1.136l3.038,3.046H9.104c-0.428,0-0.817,0.427-0.874,0.87c-0.191,1.508,0.445,1.755,0.874,1.755h19.99l-3.036,3.062c-0.306,0.313-0.306,0.821,0,1.137c0.301,0.313,0.796,0.313,1.099,0l4.345-4.487c0.431-0.42,0.589-0.719,0.589-1.098C32.09,14.683,31.942,14.413,31.501,13.982z"/>
      <path d="M24.265,7.03c0,0.537-0.469,0.973-1.048,0.973h-0.529c-0.579,0-1.049-0.436-1.049-0.973l0,0c0-0.537,0.47-0.973,1.049-0.973h0.529C23.796,6.057,24.265,6.493,24.265,7.03L24.265,7.03z"/>
      <path d="M24.265,22.726c0,0.537-0.469,0.974-1.048,0.974h-0.529c-0.579,0-1.049-0.437-1.049-0.974l0,0c0-0.537,0.47-0.973,1.049-0.973h0.529C23.796,21.753,24.265,22.188,24.265,22.726L24.265,22.726z"/>
    </symbol>

    <symbol id="folder" viewBox="0 0 33 30">
      <path fill="#238ECD" d="M32.592,3.742c-0.271-0.271-0.594-0.407-0.966-0.407H1.375c-0.373,0-0.695,0.136-0.967,0.407
  C0.135,4.014,0,4.335,0,4.708v20.584c0,0.373,0.136,0.694,0.408,0.966s0.595,0.408,0.967,0.408h30.251
  c0.372,0,0.694-0.137,0.966-0.408S33,25.665,33,25.292V4.708C33,4.335,32.864,4.014,32.592,3.742z"/>
    </symbol>

    <symbol id="sheet" viewBox="0 0 23.624 30">
      <path d="M0,0v30h23.624V4.162L19.234,0H0z M21.582,28.002H2.043V1.997h16.139v3.169h3.397v22.836H21.582z"/>
    </symbol>

    <symbol id="sheets" viewBox="0 0 33 30">
      <polygon points="22.376,0 7.151,0 7.151,5.25 8.769,5.25 8.769,1.581 21.543,1.581 21.543,4.089 24.232,4.089 24.232,5.25 24.233,5.25 25.85,5.25 25.85,3.294"/>
      <path d="M11.493,12.701c-0.838,0-0.838,1.273,0,1.273h10.015c0.839,0,0.839-1.273,0-1.273H11.493z M21.508,15.712H11.493c-0.838,0-0.838,1.272,0,1.272h10.015C22.347,16.984,22.347,15.712,21.508,15.712z M21.508,18.5H11.493c-0.838,0-0.838,1.272,0,1.272h10.015C22.347,19.772,22.347,18.5,21.508,18.5z M21.508,21.511H11.493c-0.838,0-0.838,1.271,0,1.271h10.015C22.347,22.782,22.347,21.511,21.508,21.511z M21.315,24.351H11.3c-0.837,0-0.837,1.272,0,1.272h10.016C22.152,25.623,22.152,24.351,21.315,24.351z M22.376,6.188H7.151v23.746H25.85V9.483L22.376,6.188z M24.232,28.354H8.769V7.77h12.774v2.508h2.689V28.354z"/>
    </symbol>

    <symbol id="feedback" viewBox="0 0 33 30">
      <path d="M6.064,13.44h20.832v2.029H6.064V13.44z"/>
      <path d="M6.064,7.134h20.832v2.032H6.064V7.134z"/>
      <path d="M29.755,0H3.245C1.85,0,0.72,1.132,0.72,2.523v17.675c0,1.394,1.13,2.526,2.525,2.526H6.06v7.234l9.865-7.234h13.831c1.395,0,2.524-1.133,2.524-2.526V2.523C32.279,1.132,31.149,0,29.755,0z M30.397,18.5c0,1.284-1.044,2.329-2.328,2.329H15.121l-6.852,4.96v-4.96H4.276c-1.286,0-1.722-1.045-1.722-2.329V4.307c0-1.283,1.042-2.327,2.328-2.327h23.187c1.284,0,2.328,1.044,2.328,2.327V18.5z"/>
    </symbol>

    <symbol id="select" viewBox="0 0 33 30">
      <path d="M32.688,18.354l-7.937,2.649v8.684L15.46,13.018L32.688,18.354z"/>
      <path d="M17.037,28.623h-0.27c-0.744,0-1.345-0.603-1.345-1.347c0-0.742,0.602-1.344,1.345-1.344h0.27c0.742,0,1.346,0.602,1.346,1.344C18.383,28.021,17.779,28.623,17.037,28.623z M12.46,28.623h-0.27c-0.743,0-1.345-0.603-1.345-1.347c0-0.742,0.603-1.344,1.345-1.344h0.27c0.744,0,1.346,0.602,1.346,1.344C13.807,28.021,13.204,28.623,12.46,28.623z M7.89,28.566c-0.064,0-0.129-0.004-0.194-0.013c-0.112-0.018-0.223-0.035-0.333-0.058c-0.729-0.144-1.204-0.853-1.06-1.581c0.145-0.729,0.853-1.204,1.582-1.059c0.065,0.011,0.131,0.023,0.196,0.033c0.735,0.107,1.246,0.788,1.14,1.524C9.123,28.085,8.547,28.566,7.89,28.566z M4.154,26.173c-0.441,0-0.872-0.215-1.13-0.61c-0.062-0.096-0.121-0.193-0.179-0.292c-0.372-0.643-0.151-1.466,0.492-1.838s1.466-0.151,1.838,0.491c0.033,0.058,0.067,0.112,0.103,0.167c0.406,0.622,0.23,1.456-0.392,1.863C4.66,26.103,4.405,26.173,4.154,26.173z M3.283,21.767c-0.742,0-1.345-0.603-1.345-1.346v-0.27c0-0.742,0.603-1.344,1.345-1.344c0.744,0,1.346,0.602,1.346,1.344v0.27C4.629,21.164,4.027,21.767,3.283,21.767z M3.283,17.191c-0.742,0-1.345-0.604-1.345-1.346v-0.271c0-0.743,0.603-1.345,1.345-1.345c0.744,0,1.346,0.602,1.346,1.345v0.271C4.629,16.588,4.027,17.191,3.283,17.191z M29.085,13.288c-0.742,0-1.344-0.603-1.344-1.347v-0.269c0-0.744,0.602-1.347,1.344-1.347c0.744,0,1.347,0.603,1.347,1.347v0.269C30.432,12.685,29.829,13.288,29.085,13.288z M3.283,12.615c-0.742,0-1.345-0.603-1.345-1.346V11c0-0.743,0.603-1.346,1.345-1.346c0.744,0,1.346,0.604,1.346,1.346v0.269C4.629,12.013,4.027,12.615,3.283,12.615z M29.085,8.711c-0.742,0-1.344-0.603-1.344-1.346V7.097c0-0.744,0.602-1.346,1.344-1.346c0.744,0,1.347,0.602,1.347,1.346v0.269C30.432,8.109,29.829,8.711,29.085,8.711z M3.286,8.04c-0.013,0-0.026,0-0.04,0C2.503,8.017,1.919,7.397,1.94,6.655C1.944,6.541,1.949,6.43,1.959,6.317C2.018,5.577,2.67,5.026,3.407,5.083c0.742,0.059,1.294,0.708,1.235,1.449c-0.004,0.066-0.008,0.133-0.01,0.201C4.61,7.463,4.012,8.04,3.286,8.04z M27.622,4.513c-0.358,0-0.714-0.142-0.979-0.422c-0.046-0.048-0.094-0.097-0.142-0.143c-0.537-0.515-0.554-1.367-0.041-1.903c0.516-0.536,1.367-0.554,1.904-0.04c0.081,0.078,0.159,0.158,0.234,0.239c0.513,0.542,0.486,1.393-0.053,1.902C28.286,4.391,27.953,4.513,27.622,4.513z M5.238,4.053c-0.388,0-0.773-0.167-1.039-0.489C3.727,2.991,3.807,2.142,4.38,1.67c0.086-0.071,0.173-0.14,0.262-0.207C5.238,1.019,6.081,1.14,6.526,1.735S6.85,3.174,6.255,3.619C6.2,3.66,6.146,3.702,6.093,3.746C5.843,3.953,5.54,4.053,5.238,4.053z M23.519,2.82H23.25c-0.743,0-1.346-0.602-1.346-1.346c0-0.743,0.603-1.346,1.346-1.346h0.269c0.743,0,1.347,0.603,1.347,1.346C24.865,2.218,24.262,2.82,23.519,2.82z M18.943,2.82h-0.27c-0.743,0-1.346-0.602-1.346-1.346c0-0.743,0.603-1.346,1.346-1.346h0.27c0.743,0,1.346,0.603,1.346,1.346C20.289,2.218,19.687,2.82,18.943,2.82z M14.367,2.82h-0.27c-0.743,0-1.345-0.602-1.345-1.346c0-0.743,0.603-1.346,1.345-1.346h0.27c0.744,0,1.346,0.603,1.346,1.346C15.713,2.218,15.111,2.82,14.367,2.82z M9.792,2.82H9.522c-0.743,0-1.345-0.602-1.345-1.346c0-0.743,0.602-1.346,1.345-1.346h0.269c0.744,0,1.346,0.603,1.346,1.346C11.137,2.218,10.535,2.82,9.792,2.82z"/>
    </symbol>

    <symbol id="notifications" viewBox="0 0 33 30">
      <path d="M24.265,7.03c0,0.537-0.469,0.973-1.048,0.973h-0.529c-0.579,0-1.049-0.436-1.049-0.973l0,0c0-0.537,0.47-0.973,1.049-0.973h0.529C23.796,6.057,24.265,6.493,24.265,7.03L24.265,7.03z"/>
      <path d="M24.265,22.726c0,0.537-0.469,0.974-1.048,0.974h-0.529c-0.579,0-1.049-0.437-1.049-0.974l0,0c0-0.537,0.47-0.973,1.049-0.973h0.529C23.796,21.753,24.265,22.188,24.265,22.726L24.265,22.726z"/>
      <path d="M26.567,17.975v-7.934c0-5.477-4.508-9.916-10.067-9.916S6.433,4.564,6.433,10.041v7.934l-4.026,7.934h9.162c0.465,2.263,2.496,3.967,4.932,3.967s4.467-1.704,4.933-3.967h9.161L26.567,17.975z M16.5,27.891c-1.313,0-2.419-0.828-2.836-1.982h5.673C18.919,27.062,17.813,27.891,16.5,27.891z M5.807,23.549l2.917-5.745v-7.66c0-4.231,3.481-7.661,7.776-7.661s7.777,3.43,7.777,7.661v7.66l2.916,5.745H5.807z"/>
    </symbol>

    <symbol id="help" viewBox="0 0 33 30">
      <path fill="#FFFFFF" d="M24.266,7.03c0,0.537-0.47,0.973-1.049,0.973h-0.529c-0.578,0-1.049-0.436-1.049-0.973l0,0
        c0-0.537,0.471-0.973,1.049-0.973h0.529C23.796,6.057,24.266,6.493,24.266,7.03L24.266,7.03z"/>
      <path fill="#FFFFFF" d="M24.266,22.727c0,0.537-0.47,0.974-1.049,0.974h-0.529c-0.578,0-1.049-0.437-1.049-0.974l0,0
        c0-0.537,0.471-0.974,1.049-0.974h0.529C23.796,21.753,24.266,22.188,24.266,22.727L24.266,22.727z"/>
      <g>
        <g>
          <path fill="#FFFFFF" d="M9.666,2.846c0,0-0.295,0.308-0.512,0.533C9.271,3.258,9.426,3.097,9.666,2.846z M22.909,2.471
            C21.3,0.989,19.161,0.25,16.486,0.25c-2.891,0-5.165,0.866-6.82,2.596C8.009,4.576,7.18,6.863,7.18,9.706h3.625
            c0.068-1.711,0.348-3.022,0.834-3.93c0.867-1.631,2.435-2.447,4.704-2.447c1.831,0,3.146,0.475,3.938,1.424
            c0.795,0.947,1.19,2.066,1.19,3.355c0,0.922-0.272,1.808-0.815,2.665c-0.297,0.486-0.69,0.954-1.177,1.402l-1.63,1.561
            c-1.562,1.488-2.573,2.806-3.033,3.96c-0.46,1.15-0.692,2.669-0.692,4.549h3.624c0-1.656,0.196-2.91,0.581-3.76
            c0.388-0.85,1.233-1.885,2.535-3.111c1.792-1.685,2.982-2.961,3.572-3.83c0.589-0.868,0.888-2,0.888-3.396
            C25.324,5.846,24.52,3.954,22.909,2.471z M14.042,29.625h4.051V25.52h-4.051V29.625z"/>
        </g>
      </g>
    </symbol>

    <symbol id="move" viewBox="0 0 33 30">
      <path d="M30.987,14.803l-5.011-5.007v3.283h-7.751V5.327h3.282l-5.009-5.009l-5.01,5.009h3.286v7.752H7.023V9.796
        l-5.01,5.007l5.01,5.01v-3.287h7.751v7.756h-3.286l5.01,5.009l5.009-5.009h-3.282v-7.756h7.751v3.287L30.987,14.803z"/>
    </symbol>

    <symbol id="rotate-left" viewBox="0 0 33 30">
      <path d="M1.669,14.999C1.673,23.191,8.312,29.828,16.5,29.832c8.191-0.004,14.83-6.641,14.832-14.833
        C31.33,6.81,24.691,0.168,16.5,0.168c-2.908,0-5.616,0.848-7.903,2.297L6.303,0.168l-1.464,9l8.88-1.583l-2.41-2.411
        c1.553-0.821,3.316-1.296,5.192-1.298c6.143,0.01,11.112,4.979,11.125,11.123c-0.013,6.143-4.981,11.11-11.125,11.121
        c-6.142-0.011-11.11-4.977-11.122-11.121H1.669z"/>
    </symbol>

    <symbol id="rotate-right" viewBox="0 0 33 30">
      <path d="M27.621,14.999c-0.012,6.145-4.979,11.11-11.122,11.121c-6.143-0.011-11.112-4.979-11.124-11.121
        C5.388,8.856,10.356,3.887,16.5,3.876c1.875,0.001,3.639,0.477,5.192,1.298l-2.41,2.411l8.88,1.583l-1.464-9l-2.295,2.297
        c-2.287-1.449-4.995-2.297-7.903-2.297C8.309,0.168,1.67,6.81,1.668,14.999C1.67,23.191,8.309,29.828,16.5,29.832
        c8.189-0.004,14.828-6.641,14.832-14.833H27.621z"/>
    </symbol>

    <symbol id="hotspot" viewBox="0 0 33 30">
      <path d="M16.5,4.467C10.693,4.467,5.967,9.193,5.967,15c0,5.809,4.726,10.533,10.533,10.533
        c5.809,0,10.532-4.725,10.532-10.533C27.031,9.193,22.309,4.467,16.5,4.467z M22.338,18.003c-0.328,0.385-0.795,0.587-1.266,0.588
        c-0.379,0-0.76-0.13-1.075-0.394l-3.499-2.964l-3.492,2.975c-0.699,0.596-1.745,0.512-2.34-0.187
        c-0.596-0.698-0.512-1.746,0.185-2.342l4.565-3.891c0.62-0.526,1.529-0.529,2.15-0.002l4.577,3.873
        C22.845,16.254,22.929,17.302,22.338,18.003z"/>
      <path fill-rule="evenodd" clip-rule="evenodd" d="M16.5,0.25C8.354,0.25,1.75,6.854,1.75,15
        c0,8.146,6.604,14.75,14.75,14.75c8.147,0,14.75-6.604,14.75-14.75C31.249,6.854,24.646,0.25,16.5,0.25z M16.5,28.016
        C9.312,28.016,3.485,22.187,3.485,15c0-7.188,5.826-13.016,13.014-13.016c7.187,0,13.013,5.828,13.013,13.016
        C29.513,22.187,23.687,28.016,16.5,28.016z"/>
    </symbol>

    <symbol id="info" viewBox="0 0 33 30">
      <path fill="#FFFFFF" d="M19.468,0.105c1.978,0,2.967,1.349,2.967,2.892c0,1.926-1.718,3.708-3.956,3.708
        c-1.874,0-2.967-1.108-2.915-2.938C15.563,2.225,16.864,0.105,19.468,0.105z M13.377,29.645c-1.562,0-2.707-0.963-1.613-5.203
        l1.793-7.521c0.312-1.203,0.363-1.685,0-1.685c-0.469,0-2.497,0.832-3.695,1.651l-0.78-1.301c3.8-3.228,8.171-5.121,10.045-5.121
        c1.561,0,1.821,1.879,1.041,4.77l-2.053,7.905c-0.364,1.396-0.208,1.878,0.155,1.878c0.469,0,2.006-0.58,3.514-1.784l0.886,1.204
        C18.973,28.197,14.938,29.645,13.377,29.645z"/>
    </symbol>

    <symbol id="follow-link" viewBox="0 0 33 30">
      <path d="M30.557,0.417H7.678c-0.225,0-0.407,0.182-0.407,0.407v6.551c0,0.225,0.183,0.407,0.407,0.407h2.734
        c0.225,0,0.407-0.182,0.407-0.407V3.967h16.594v22.066H10.819v-3.407c0-0.225-0.183-0.406-0.407-0.406H7.678
        c-0.225,0-0.407,0.182-0.407,0.406v6.551c0,0.226,0.183,0.407,0.407,0.407h22.879c0.225,0,0.407-0.182,0.407-0.407V0.823
        C30.964,0.598,30.781,0.417,30.557,0.417z"/>
      <path d="M14.783,20.188c-0.052,0-0.104-0.009-0.154-0.03c-0.153-0.062-0.252-0.212-0.252-0.376v-3.029H2.442
        c-0.225,0-0.407-0.183-0.407-0.407v-2.711c0-0.225,0.183-0.407,0.407-0.407h11.935v-2.941c0-0.166,0.099-0.314,0.252-0.376
        c0.15-0.064,0.327-0.028,0.444,0.089l4.706,4.749c0.156,0.159,0.156,0.415,0,0.573l-4.706,4.748
        C14.995,20.146,14.891,20.188,14.783,20.188z"/>
    </symbol>
  </svg>

</head>
<body>

<div id="header" data-bind="visible: true" style="display: none">
  <img class="logo" src="${ pageContext.servletContext.contextPath }/resources/marzipanoTool/assets/img/marzipano-light.png">
  <a href="#" class="button expandMessages" data-bind="click: toggleMessagesExpanded, css: { expanded: messagesExpanded }">
    <svg class="icon"><use xlink:href="#notifications"></use></svg>
    <div class="unread-bubble" data-bind="visible: messages.numNotRead()">
      <div class="unread-number" data-bind="text: messages.numNotRead()"></div>
    </div>

  </a>
  <a href="#" class="button export disabled hint--left" data-bind="click: getPanoramasArchive, css: { disabled: !readyToDownload() }, attr: { 'data-hint': readyToDownload() ? null : 'Exporting will be possible when processing completes' }">
    <div class="text">Export</div>
    <svg class="icon"><use xlink:href="#export"></use></svg>
  </a>
  <a href="#" class="button helpButton" data-bind="click: toggleHelp">
    <svg class="icon"><use xlink:href="#help"></use></svg>
  </a>

</div>

<div id="main" data-bind="visible: true" style="display: none">

  <div id="sidebar">

    <div class="wrapper">
      <div class="project-name">
        <input class="input" type="text" data-bind="textInput: projectName, alignOnBlur, stopKeyPropagation" disabled>
        <a id="project-name-edit" href="#" class="edit" data-bind="click: editProjectName">
          <svg class="icon"><use xlink:href="#pencil"></use></svg>
        </a>
        <!--
        <a href="#" class="toggle">
          <svg class="icon expand"><use xlink:href="#expand"></use></svg>
          <svg class="icon collapse"><use xlink:href="#collapse"></use></svg>
        </a>
        -->
      </div>

      <div class="accordion settings expand" data-bind="css: { expand: accordionsOpen.settings }">
        <div class="accordion-name" data-bind="click: accordionToggle.bind(null, 'settings')">
          <svg class="icon"><use xlink:href="#shutter"></use></svg>
          <div class="text">Settings</div>
          <a href="#" class="toggle">
            <svg class="icon up"><use xlink:href="#up"></use></svg>
            <svg class="icon down"><use xlink:href="#down"></use></svg>
          </a>
        </div>
        <div class="accordion-content">
          <div class="setting">
            <label class="setting-choice">
              <input class="input" type="radio" data-bind="checked: settings.mouseViewMode" name="mouseViewMode" value="drag" id="dragMouseViewMode" checked="true">
              <div class="text">Drag</div>
              <svg class="icon enable"><use xlink:href="#enable"></use></svg>
              <svg class="icon disable"><use xlink:href="#disable"></use></svg>
            </label>
            <label class="setting-choice">
              <input class="input" type="radio" data-bind="checked: settings.mouseViewMode" name="mouseViewMode" value="qtvr" id="qtvrMouseViewMode">
              <div class="text">QTVR</div>
              <svg class="icon enable"><use xlink:href="#enable"></use></svg>
              <svg class="icon disable"><use xlink:href="#disable"></use></svg>
            </label>
          </div>
          <div class="setting">
            <label class="setting-choice">
              <input class="input" type="checkbox" id="autorotateEnabled" data-bind="checked: settings.autorotateEnabled" checked="true">
                <div class="text">Autorotate</div>
                <svg class="icon enable"><use xlink:href="#enable"></use></svg>
                <svg class="icon disable"><use xlink:href="#disable"></use></svg>
            </label>
          </div>
          <div class="setting">
            <label class="setting-choice">
              <input class="input" type="checkbox" id="viewControlButtons" data-bind="checked: settings.viewControlButtons" checked="true">
                <div class="text">View control buttons</div>
                <svg class="icon enable"><use xlink:href="#enable"></use></svg>
                <svg class="icon disable"><use xlink:href="#disable"></use></svg>
            </label>
          </div>
          <div class="setting">
            <label class="setting-choice">
              <input class="input" type="checkbox" id="fullscreenButton" data-bind="checked: settings.fullscreenButton" checked="true">
                <div class="text">Fullscreen button</div>
                <svg class="icon enable"><use xlink:href="#enable"></use></svg>
                <svg class="icon disable"><use xlink:href="#disable"></use></svg>
            </label>
          </div>
        </div>
      </div>

      <div class="accordion panoramas expand" data-bind="css: { expand: accordionsOpen.panoramaList }">
        <div class="accordion-name" data-bind="click: accordionToggle.bind(null, 'panoramaList')">
          <svg class="icon"><use xlink:href="#gallery"></use></svg>
          <div class="text">Panorama List</div>
          <a href="#" class="toggle">
            <svg class="icon up"><use xlink:href="#up"></use></svg>
            <svg class="icon down"><use xlink:href="#down"></use></svg>
          </a>
        </div>
        <div class="accordion-content">
          <a href="#" class="more-files">
            <svg class="icon"><use xlink:href="#select"></use></svg>
            <div class="text">Add more panoramas</div>
            <input class="input" type="file" id="selectFilesInput" multiple>
          </a>
          <ul class="panorama-list" data-bind="foreach: panoramas.list, visible: true" style="display: none;">
            <li class="panorama" data-bind="click: select, css: { selected: isSelected(), queued: processingState.isQueued(), started: processingState.isStarted(), successful: processingState.isSuccessful(), failed: processingState.isFailed() }, attr: { 'data-panorama-id': uniqueId() }">
              <a href="#" class="handle">
                <svg class="icon"><use xlink:href="#handle"></use></svg>
              </a>
              <div class="info">
                <div class="properties">
                  <input class="name" type="text" data-bind="textInput: name, click: select, alignOnBlur, stopKeyPropagation" disabled>
                  <a href="#" class="action edit" data-bind="click: edit, visible: !processingState.isFailed()">
                    <svg class="icon pencil"><use xlink:href="#pencil"></use></svg>
                  </a>
                  <a href="#" class="action delete" data-bind="click: remove">
                    <svg class="icon"><use xlink:href="#trash"></use></svg>
                  </a>
                </div>
                <div class="status">
                  <div class="state">
                    <svg class="icon queued"><use xlink:href="#hourglass"></use></svg>
                    <svg class="icon started"><use xlink:href="#flask"></use></svg>
                    <svg class="icon successful"><use xlink:href="#check"></use></svg>
                    <svg class="icon failed"><use xlink:href="#cross"></use></svg>
                    <div class="message" data-bind="text: processingState.userMessage() || 'Processing'"></div>
                  </div>
                </div>
                <div class="progress">
                  <progress class="bar" max="1" data-bind="attr: { value: processingState.userProgress() }"></progress>
                </div>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </div>

  </div>

  <div id="workspace">
    <div class="preview" data-bind="css: { visible: previewVisible(), disabled: previewedFailed() }">
      <div class="panorama-name" data-bind="text: panoramas.selected && panoramas.selected.name"></div>

      <div class="preview-area">

        <div id="pano"></div>

        <ul class="hotspots-container" data-bind="foreach: { data: hotspots.list, as: 'hotspot' }">

          <!-- ko if: hotspotType() === 'link' -->
          <li class="hotspot link-hotspot" data-bind="visible: visible, css: { targetSelectorVisible: targetSelectorVisible, dragging: dragging }, style: { left: left, top: top }, event: { mousemove: interruptAutorotate }">
              <div class="hotspot-image-wrapper hint--preview hint--right" data-bind="attr: { 'data-hint': targetName() }">
                <img class="hotspot-image" src="${ pageContext.servletContext.contextPath }/resources/marzipanoTool/assets/img/hotspot.png" data-bind="event: { mousedown: startDrag }, style: { transform: imageTransform() }">
              </div>
              <div class="hotspot-tool link-hotspot-follow" data-bind="click: goToTarget">
                <svg class="icon"><use xlink:href="#follow-link"></use></svg>
              </div>
              <div class="hotspot-tool hotspot-remove link-hotspot-remove" data-bind="click: remove">
                <svg class="icon"><use xlink:href="#trash"></use></svg>
              </div>
              <div class="hotspot-tool hotspot-edit link-hotspot-edit" data-bind="event: { mousedown: editTarget }">
                <svg class="icon"><use xlink:href="#pencil"></use></svg>
              </div>
              <div class="hotspot-tool hotspot-rotate-right link-hotspot-rotate-right" data-bind="click: rotateRight">
                <svg class="icon"><use xlink:href="#rotate-right"></use></svg>
              </div>
              <div class="hotspot-target-selector" data-bind="visible: targetSelectorVisible">
                <h3>Select target scene</h3>
                <svg class="icon close" data-bind="click: closeTargetSelector"><use xlink:href="#cross"></use></svg>
                <ul data-bind="foreach: $root.panoramas.list">
                  <li data-bind="text: name, click: hotspot.selectTarget.bind(hotspot), css: { currentTarget: hotspot.targetIs($data) }"></li>
                </ul>
              </div>
            </li>
            <!-- /ko -->

            <!-- ko if: hotspotType() === 'info' -->
            <li class="hotspot info-hotspot" data-bind="visible: visible, css: { editingTitle: editingTitle, editingText: editingText, isUnchanged: isUnchanged() }, style: { left: left, top: top }, event: { mousemove: interruptAutorotate }">
              <div class="hotspot-image-wrapper hint--preview hint--right">
                <img class="hotspot-image" src="${ pageContext.servletContext.contextPath }/resources/marzipanoTool/assets/img/info.png" data-bind="event: { mousedown: startDrag }">
              </div>
              <div class="info-hotspot-tooltip">
                <div class="titleWrapper">
                  <div class="title" data-bind="contenteditable: _hotspot.getObservable('title'), alignOnBlur, stopKeyPropagation, event: { keydown: interruptAutorotate }"></div>
                  <a href="#" class="action edit" data-bind="click: editTitle, visible: !editingTitle">
                    <svg class="icon pencil"><use xlink:href="#pencil"></use></svg>
                  </a>
                  <a href="#" class="action ok" data-bind="click: finishEditTitle, visible: editingTitle">
                    <svg class="icon pencil"><use xlink:href="#check"></use></svg>
                  </a>
                </div>
                <div class="textWrapper">
                  <div class="text" data-bind="contenteditable: _hotspot.getObservable('text'), alignOnBlur, stopKeyPropagation, event: { keydown: interruptAutorotate }"></div>
                  <a href="#" class="action edit" data-bind="click: editText, visible: !editingText">
                    <svg class="icon pencil"><use xlink:href="#pencil"></use></svg>
                  </a>
                  <a href="#" class="action ok" data-bind="click: finishEditText, visible: editingText">
                    <svg class="icon pencil"><use xlink:href="#check"></use></svg>
                  </a>
                </div>
              </div>
              <div class="hotspot-tool hotspot-remove info-hotspot-remove" data-bind="click: remove">
                <svg class="icon"><use xlink:href="#trash"></use></svg>
              </div>
            </li>
            <!-- /ko -->


        </ul>

        <div class="initial-view-hint">
          <div class="icon">
            <img class="outer" src="${ pageContext.servletContext.contextPath }/resources/marzipanoTool/assets/img/eye-outer.svg"></img>
            <img class="inner" src="${ pageContext.servletContext.contextPath }/resources/marzipanoTool/assets/img/eye-inner.svg"></img>
          </div>
          <div class="text">Initial view set</div>
        </div>

        <div class="error-cover" data-bind="visible: previewedFailed(), if: previewedFailed()">
          <div class="error-message">
            <div class="title">This panorama has failed to process</div>
            <div class="message" data-bind="text: previewFailedMessage()"></div>
          </div>
        </div>

      </div>
      <div style="margin-bottom: 50px"></div>
	<!-- 링크핫스팟 인포핫스팟 부분 뷰어에서 작동을 안해서 죽임 -->
      <!-- <div id="panorama-settings" class="panorama-settings">
        <div class="add-info-hotspot panorama-settings-button" data-bind="click: addInfoHotspot">
          <svg class="icon"><use xlink:href="#info"></use></svg>
          <div class="text">Info hotspot</div>
        </div>
        <div class="add-link-hotspot panorama-settings-button" data-bind="click: addLinkHotspot">
          <svg class="icon"><use xlink:href="#hotspot"></use></svg>
          <div class="text">Link hotspot</div>
        </div>
        <div class="initial-view panorama-settings-button" data-bind="click: setInitialView">
          <svg class="icon"><use xlink:href="#eye"></use></svg>
          <div class="text">Set initial view</div> -->
        </div>
      </div>
    </div>
  </div>

<div id="help-screen" class="help-screen" data-bind="visible: helpVisible, click: closeHelp" style="display: none;">
  <img src="${ pageContext.servletContext.contextPath }/resources/marzipanoTool/assets/img/help-left.svg" class="help-left">
  <img src="${ pageContext.servletContext.contextPath }/resources/marzipanoTool/assets/img/help-top.svg" class="help-top">
</div>

</div>

<div id="shade" data-bind="visible: true, css: { hidden: !shadeVisible }" style="display: none">

  <div id="intro" data-bind="visible: introVisible">
    <h1 class="title">Marzipano Tool</h1>
    <div class="body">
      <p>The Marzipano Tool processes your panoramas and exports a web application which uses Marzipano to view them.</p>
      <p>All processing is done on the browser; the files are not uploaded to a server.</p>
      <p>The panorama names, initial views and other settings can be edited on the tool. More customization is possible by editing the exported Javascript, HTML and CSS code.</p>
    </div>

    <div class="footer">
      <a href="#" class="start" data-bind="click: hideIntro">Start</a>
    </div>
  </div>

  <div id="startup" data-bind="visible: startupVisible" style="display: none;">
    <h1 class="title">Add some panoramas</h1>
    <div class="body">
      <div class="area">
        <svg class="icon"><use xlink:href="#gallery"></use></svg>
        <div class="text">Drag and drop files here or anywhere else on the window</div>

        <div class="requirements">
          <div class="summary">File requirements</div>
          <ul>
            <li>Sphere (equirectangular) or cubefaces</li>
            <li>Equirectangular aspect ratio 2:1</li>
            <li>Cube filename suffixes _b, _d, _f, _r, _t, _u</li>
            <li>JPEG or TIFF</li>
            <li>Maximum sphere size <span data-bind="text: equirectangularSizeLimit()"></span></li>
            <li>Maximum cube size <span data-bind="text: cubeSizeLimit()"></span></li>
          </ul>
        </div>
        <!--<ul class="subtitle">

        </ul>-->
      </div>
    </div>
    <div class="footer">
      <a href="#" class="select">
        <svg class="icon"><use xlink:href="#select"></use></svg>
        <div class="text">Select files</div>
      </a>
    </div>
  </div>

  <div id="download" data-bind="visible: downloadVisible, if: zipProcessingState" style="display: none;">
    <div data-bind="css: { started: zipProcessingState.isStarted(), successful: zipProcessingState.isSuccessful(), failed: zipProcessingState.isFailed() }">
      <div class="status">

        <img class="icon processing" src="${ pageContext.servletContext.contextPath }/resources/marzipanoTool/assets/img/export-started.svg" data-bind="visible: zipProcessingState.isStarted()">
        <img class="icon error" src="${ pageContext.servletContext.contextPath }/resources/marzipanoTool/assets/img/export-failed.svg" data-bind="visible: zipProcessingState.isFailed()">
        <img class="icon successful" src="${ pageContext.servletContext.contextPath }/resources/marzipanoTool/assets/img/export-successful.svg" data-bind="visible: zipProcessingState.isSuccessful()">

        <!--
        <div class="progress">
          <progress class="bar" max="1" value="0.3"></progress>
        </div>-->
        <div class="state">
          <div class="message processingMessage" data-bind="visible: zipProcessingState.isStarted()"><div class="title">Generating zip archive</div></div>
          <div class="message successMessage" data-bind="visible: zipProcessingState.isSuccessful()">
            <div class="title">Zip archive generated, download should start now.</div>
            <p>Check the <span class="bold">README.txt</span> file included in the archive for additional help.</p>
            <p>You may customize the application by editing its Javascript, HTML and CSS files.</p>
          </div>
          <div class="message errorMessage" data-bind="visible: zipProcessingState.isFailed()"><div class="title">Failed to generate zip archive</div></div>
        </div>
      </div>
      <div class="actions">
        <button class="ok" data-bind="click: closeZipState, visible: zipProcessingState.isEnded()">OK</button>
        <!--<button class="cancel" data-bind="click: cancelZip, visible: zipProcessingState.isStarted()">Cancel</button>-->
      </div>
    </div>
  </div>

</div>

<div id="messages" class="messages" data-bind="visible: true, css: { messagesVisible: messagesVisible.length > 0, messagesExpanded: messagesExpanded }, click: showMessages" style="display: none">
  <div class="wrapper">
    <div class="messagesTitle">Notifications</div>
    <svg class="icon close" data-bind="click: closeMessages, clickBubble: false, visible: messagesExpanded"><use xlink:href="#cross"></use></svg>
    <ul class="messagesList" data-bind="foreach: messagesVisible">
      <li class="message" data-bind="html: html, css: level"></li>
    </ul>
  </div>
</div>

<div id="unsupported" style="display: none">
  <h1 class="unfortunately">Unfortunately, your browser is not supported.</h1>
  <div id="unsupported-browser" style="display: none">
    <h2 class="latest">Please use the latest version of</h2>
    <div class="browsers">
      <a class="browser chrome" href="http://www.google.com/chrome/" target="_blank">
        <img class="icon" title="Google Chrome" src="${ pageContext.servletContext.contextPath }/resources/marzipanoTool/assets/img/chrome.png">
      </a>
      <a class="browser firefox" href="https://www.mozilla.org/firefox/" target="_blank">
        <img class="icon" title="Mozilla Firefox" src="${ pageContext.servletContext.contextPath }/resources/marzipanoTool/assets/img/firefox.png">
      </a>
    </div>
  </div>

  <h1 id="unsupported-webgl" style="display: none">
    <img class="webgl" title="WebGL" src="${ pageContext.servletContext.contextPath }/resources/marzipanoTool/assets/img/webgl.png">
    <p class="paragraph">The Marzipano Tool requires WebGL support in your browser.</p>
    <p class="paragraph">See <a href="http://get.webgl.org/" target="_blank">http://get.webgl.org</a> for more information.</p>
  </h1>

  <h1 id="unsupported-endianess" style="display: none">
    <p class="paragraph">Your system is not little endian.</p>
  </h1>

  <div class="description">
    <img class="logo" src="${ pageContext.servletContext.contextPath }/resources/marzipanoTool/assets/img/marzipano-dark.png">
    <p class="paragraph">The Marzipano Tool processes your panoramas and lets you export a web application which uses Marzipano to view them.</p>
    <p class="paragraph">All processing is done on the browser, the files are not uploaded to a server.</p>
    <p class="paragraph">The panorama names, initial views and other settings can be edited on the tool. More customization is possible by editing the exported Javascript, HTML and CSS code.</p>
  </div>
</div>


<!-- <div class="zipState" data-bind="visible: zipProcessingState, if: zipProcessingState">
  <div data-bind="html: zipProcessingState.toStringTree()"></div>
  <div data-bind="visible: zipProcessingState.isStarted(), click: cancelZip">Cancel</div>
  <div data-bind="visible: zipProcessingState.isEnded(), click: closeZipState">Close</div>
</div> -->

<script>window.DEBUG=false;</script>
<script src="${ pageContext.servletContext.contextPath }/resources/marzipanoTool/assets/js/app.js"></script>

</body>
</html>
