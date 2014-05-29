VENDOR = "vendor"
requirejs.config
  paths:
    'jquery': "#{VENDOR}/jquery.min"
    'underscore': "#{VENDOR}/underscore.min"
    'jade': "#{VENDOR}/jade.min"
    'd3': "#{VENDOR}/d3.min"
    'io': "#{VENDOR}/socket.min"
    'three': "#{VENDOR}/three.min"
  shim:
    'jquery': exports: '$'
    'underscore': exports: '_'
    'jade': exports: 'jade'
    'd3': exports: 'd3'

requirejs ['jquery', 'underscore', 'three'], ($, _) ->
  scene = new THREE.Scene()
  camera = new THREE.PerspectiveCamera(75, window.innerWidth/window.innerHeight, 0.1, 1000)

  renderer = new THREE.WebGLRenderer()
  renderer.setSize(window.innerWidth, window.innerHeight)
  document.body.appendChild(renderer.domElement)

  geometry = new THREE.CubeGeometry(1,1,1)
  material = new THREE.MeshBasicMaterial({color: 0x00ff00})
  cube = new THREE.Mesh(geometry, material)
  scene.add(cube)

  camera.position.z = 5

  render = ->
    requestAnimationFrame(render)

    cube.rotation.x += 0.1
    cube.rotation.y += 0.1

    renderer.render(scene, camera)

  render()
