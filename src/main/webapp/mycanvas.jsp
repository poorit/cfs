<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>안녕하세요</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<link rel="stylesheet" href="./css/common.css">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/bootstrap-theme.min.css">
<link rel="stylesheet" href="./css/board/jasny-bootstrap.min.css">
<link href="./font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<script src="./js/bootstrap.min.js"></script>
<script src="./js/board/jasny-bootstrap.min.js"></script>
<style>
* {
	color: #444;
	font-family: Monospace;
	font-size: 12px;
}

body {
	-overflow: hidden;
}

select {
	text-transform: uppercase;
	font-size: 11px;
	text-align: center;
}

hr {
	border: 0;
	height: 1px;
	background-color: #ccc;
	margin: 20px 0px;
}

.gui {
	color: #ccc;
	width: 280px;
	background-color: #fff;
	border-bottom: 1px solid #ddd;
	padding: 5px 10px;
	text-align: center;
	text-transform: uppercase;
	line-height: 18px;
	cursor: default;
}

.button {
	padding: 2px;
	cursor: pointer;
}

.key {
	padding: 0px 8px;
	margin-left: 1px;
	background-color: #eee;
}
</style>

<!-- <script type="text/javascript" src="./js/fabric.js"></script> -->
</head>
<body style="background-color: rgb(255, 255, 255);">
	<!-- ëë 
	<div class="container">
		<button type="button" class="btn btn-labeled btn-success"
			style="font-family: Georgia; color: black;">
			<span class="btn-label"><i
				class="glyphicon glyphicon-save-file"></i></span>&nbsp;SAVE
		</button>
		<button type="button" class="btn btn-labeled btn-warning"
			style="font-family: Georgia; color: black;">
			<span class="btn-label"><i class="glyphicon glyphicon-trash"></i></span>&nbsp;CLEAR

		</button>
		<button type="button" class="btn btn-labeled btn-default"
			style="font-family: Georgia; color: black;">
			<span class="btn-label"><i
				class="glyphicon glyphicon-info-sign"></i></span>&nbsp;ABOUT
		</button>
		<br> <select name="select">
			<option value="1">1</option>
			<option value="2">2</option>
			<option>3</option>
			<option>4</option>
			<option>5</option>
		</select>
	</div>
	-->
	<!-- ë³¸ì²´ -->

	<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push([ "_setAccount", "UA-86951-7" ]);
		_gaq.push([ "_trackPageview" ]);
		(function() {
			var a = document.createElement("script");
			a.type = "text/javascript";
			a.async = true;
			a.src = ("https:" == document.location.protocol ? "https://ssl"
					: "http://www")
					+ ".google-analytics.com/ga.js";
			(document.getElementsByTagName("head")[0] || document
					.getElementsByTagName("body")[0]).appendChild(a)
		})();
		
		// ë¸ë¬ì¬ íì
		function circles(a) {
			this.init(a)
		}
		circles.prototype = {
			context : null,
			prevMouseX : null,
			prevMouseY : null,
			count : null,
			init : function(a) {
				this.context = a;
				this.context.globalCompositeOperation = "source-over"
			},
			destroy : function() {
			},
			strokeStart : function(b, a) {
				this.prevMouseX = b;
				this.prevMouseY = a
			},
			stroke : function(e, b) {
				var g, l, k, h, f, c, j, a;
		    this.context.lineCap = "butt";
				this.context.lineWidth = BRUSH_SIZE;
				this.context.strokeStyle = "rgba(" + COLOR[0] + ", " + COLOR[1]
						+ ", " + COLOR[2] + ", " + 0.1 * BRUSH_PRESSURE + ")";
				l = e - this.prevMouseX;
				k = b - this.prevMouseY;
				h = Math.sqrt(l * l + k * k) * 2;
				f = Math.floor(e / 100) * 100 + 50;
				c = Math.floor(b / 100) * 100 + 50;
				j = Math.floor(Math.random() * 10);
				a = h / j;
				for (g = 0; g < j; g++) {
					this.context.beginPath();
					this.context.arc(f, c, (j - g) * a, 0, Math.PI * 2, true);
					this.context.stroke()
				}
				this.prevMouseX = e;
				this.prevMouseY = b
			},
			strokeEnd : function() {
			}
		};
		function chrome(a) {
			this.init(a)
		}
		chrome.prototype = {
			context : null,
			prevMouseX : null,
			prevMouseY : null,
			points : null,
			count : null,
			init : function(a) {
				this.context = a;
				if (RegExp(" AppleWebKit/").test(navigator.userAgent)) {
					this.context.globalCompositeOperation = "darker"
				}
				this.points = new Array();
				this.count = 0
			},
			destroy : function() {
			},
			strokeStart : function(b, a) {
				this.prevMouseX = b;
				this.prevMouseY = a
			},
			stroke : function(f, c) {
				var e, b, a, g;
		    this.context.lineCap = "round";
				this.points.push([ f, c ]);
				this.context.lineWidth = BRUSH_SIZE;
				this.context.strokeStyle = "rgba(" + COLOR[0] + ", " + COLOR[1]
						+ ", " + COLOR[2] + ", " + 0.1 * BRUSH_PRESSURE + ")";
				this.context.beginPath();
				this.context.moveTo(this.prevMouseX, this.prevMouseY);
				this.context.lineTo(f, c);
				this.context.stroke();
				for (e = 0; e < this.points.length; e++) {
					b = this.points[e][0] - this.points[this.count][0];
					a = this.points[e][1] - this.points[this.count][1];
					g = b * b + a * a;
					if (g < 1000) {
						this.context.strokeStyle = "rgba("
								+ Math.floor(Math.random() * COLOR[0]) + ", "
								+ Math.floor(Math.random() * COLOR[1]) + ", "
								+ Math.floor(Math.random() * COLOR[2]) + ", "
								+ 0.1 * BRUSH_PRESSURE + " )";
						this.context.beginPath();
						this.context.moveTo(this.points[this.count][0]
								+ (b * 0.2), this.points[this.count][1]
								+ (a * 0.2));
						this.context.lineTo(this.points[e][0] - (b * 0.2),
								this.points[e][1] - (a * 0.2));
						this.context.stroke()
					}
				}
				this.prevMouseX = f;
				this.prevMouseY = c;
				this.count++
			},
			strokeEnd : function() {
			}
		};
		function fur(a) {
			this.init(a)
		}
		fur.prototype = {
			context : null,
			prevMouseX : null,
			prevMouseY : null,
			points : null,
			count : null,
			init : function(a) {
				this.context = a;
				this.points = new Array();
				this.context.globalCompositeOperation = "darker";
				this.count = 0
			},
			destroy : function() {
			},
			strokeStart : function(b, a) {
				this.prevMouseX = b;
				this.prevMouseY = a
			},
			stroke : function(f, c) {
				var e, b, a, g;
		    this.context.lineCap = "round";
				this.points.push([ f, c ]);
				this.context.lineWidth = BRUSH_SIZE;
				this.context.strokeStyle = "rgba(" + COLOR[0] + ", " + COLOR[1]
						+ ", " + COLOR[2] + ", " + 0.1 * BRUSH_PRESSURE + ")";
				this.context.beginPath();
				this.context.moveTo(this.prevMouseX, this.prevMouseY);
				this.context.lineTo(f, c);
				this.context.stroke();
				for (e = 0; e < this.points.length; e++) {
					b = this.points[e][0] - this.points[this.count][0];
					a = this.points[e][1] - this.points[this.count][1];
					g = b * b + a * a;
					if (g < 2000 && Math.random() > g / 2000) {
						this.context.beginPath();
						this.context.moveTo(f + (b * 0.5), c + (a * 0.5));
						this.context.lineTo(f - (b * 0.5), c - (a * 0.5));
						this.context.stroke()
					}
				}
				this.prevMouseX = f;
				this.prevMouseY = c;
				this.count++
			},
			strokeEnd : function() {
			}
		};
		function grid(a) {
			this.init(a)
		}
		grid.prototype = {
			context : null,
			init : function(a) {
				this.context = a;
				if (RegExp(" AppleWebKit/").test(navigator.userAgent)) {
					this.context.globalCompositeOperation = "darker"
				}
			},
			destroy : function() {
			},
			strokeStart : function(b, a) {
			},
			stroke : function(f, d) {
				var e, a, g, c, b;
		    this.context.lineCap = "round";
				a = Math.round(f / 100) * 100;
				g = Math.round(d / 100) * 100;
				c = (a - f) * 10;
				b = (g - d) * 10;
				this.context.lineWidth = BRUSH_SIZE;
				this.context.strokeStyle = "rgba(" + COLOR[0] + ", " + COLOR[1]
						+ ", " + COLOR[2] + ", " + 0.01 * BRUSH_PRESSURE + ")";
				for (e = 0; e < 50; e++) {
					this.context.beginPath();
					this.context.moveTo(a, g);
					this.context.quadraticCurveTo(f + Math.random() * c, d
							+ Math.random() * b, a, g);
					this.context.stroke()
				}
			},
			strokeEnd : function() {
			}
		};
		function longfur(a) {
			this.init(a)
		}
		longfur.prototype = {
			context : null,
			points : null,
			count : null,
			init : function(a) {
				this.context = a;
				this.context.globalCompositeOperation = "source-over";
				this.points = new Array();
				this.count = 0
			},
			destroy : function() {
			},
			strokeStart : function(b, a) {
			},
			stroke : function(g, c) {
				var f, e, b, a, h;
        this.context.lineCap = "round";
				this.points.push([ g, c ]);
				this.context.lineWidth = BRUSH_SIZE;
				this.context.strokeStyle = "rgba(" + COLOR[0] + ", " + COLOR[1]
						+ ", " + COLOR[2] + ", " + 0.05 * BRUSH_PRESSURE + ")";
				for (f = 0; f < this.points.length; f++) {
					e = -Math.random();
					b = this.points[f][0] - this.points[this.count][0];
					a = this.points[f][1] - this.points[this.count][1];
					h = b * b + a * a;
					if (h < 4000 && Math.random() > h / 4000) {
						this.context.beginPath();
						this.context
								.moveTo(this.points[this.count][0] + (b * e),
										this.points[this.count][1] + (a * e));
						this.context.lineTo(this.points[f][0] - (b * e)
								+ Math.random() * 2, this.points[f][1]
								- (a * e) + Math.random() * 2);
						this.context.stroke()
					}
				}
				this.count++
			},
			strokeEnd : function() {
			}
		};
		function ribbon(a) {
			this.init(a)
		}
		ribbon.prototype = {
			context : null,
			mouseX : null,
			mouseY : null,
			painters : null,
			interval : null,
			init : function(b) {
				var c = this;
				this.context = b;
				this.context.globalCompositeOperation = "source-over";
				this.mouseX = SCREEN_WIDTH / 2;
				this.mouseY = SCREEN_HEIGHT / 2;
				this.painters = new Array();
				for (var a = 0; a < 50; a++) {
					this.painters.push({
						dx : SCREEN_WIDTH / 2,
						dy : SCREEN_HEIGHT / 2,
						ax : 0,
						ay : 0,
						div : 0.1,
						ease : Math.random() * 0.2 + 0.6
					})
				}
				this.interval = setInterval(d, 1000 / 60);
				function d() {
					var e;
					this.context.lineWidth = BRUSH_SIZE;
					this.context.strokeStyle = "rgba(" + COLOR[0] + ", "
							+ COLOR[1] + ", " + COLOR[2] + ", " + 0.05
							* BRUSH_PRESSURE + ")";
					for (e = 0; e < c.painters.length; e++) {
						c.context.beginPath();
						c.context.moveTo(c.painters[e].dx, c.painters[e].dy);
						c.painters[e].dx -= c.painters[e].ax = (c.painters[e].ax + (c.painters[e].dx - c.mouseX)
								* c.painters[e].div)
								* c.painters[e].ease;
						c.painters[e].dy -= c.painters[e].ay = (c.painters[e].ay + (c.painters[e].dy - c.mouseY)
								* c.painters[e].div)
								* c.painters[e].ease;
						c.context.lineTo(c.painters[e].dx, c.painters[e].dy);
						c.context.stroke()
					}
				}
			},
			destroy : function() {
				clearInterval(this.interval)
			},
			strokeStart : function(c, a) {
				this.mouseX = c;
				this.mouseY = a;
				for (var b = 0; b < this.painters.length; b++) {
					this.painters[b].dx = c;
					this.painters[b].dy = a
				}
				this.shouldDraw = true
			},
			stroke : function(b, a) {
				this.mouseX = b;
				this.mouseY = a
        this.context.lineCap = "round";
			},
			strokeEnd : function() {
			}
		};
		function shaded(a) {
			this.init(a)
		}
		shaded.prototype = {
			context : null,
			prevMouseX : null,
			prevMouseY : null,
			points : null,
			count : null,
			init : function(a) {
				this.context = a;
				this.context.globalCompositeOperation = "source-over";
				this.points = new Array();
				this.count = 0
			},
			destroy : function() {
			},
			strokeStart : function(b, a) {
				this.prevMouseX = b;
				this.prevMouseY = a
			},
			stroke : function(f, c) {
				var e, b, a, g;
        this.context.lineCap = "round";
				this.points.push([ f, c ]);
				this.context.lineWidth = BRUSH_SIZE;
				for (e = 0; e < this.points.length; e++) {
					b = this.points[e][0] - this.points[this.count][0];
					a = this.points[e][1] - this.points[this.count][1];
					g = b * b + a * a;
					if (g < 1000) {
						this.context.strokeStyle = "rgba(" + COLOR[0] + ", "
								+ COLOR[1] + ", " + COLOR[2] + ", "
								+ ((1 - (g / 1000)) * 0.1 * BRUSH_PRESSURE)
								+ " )";
						this.context.beginPath();
						this.context.moveTo(this.points[this.count][0],
								this.points[this.count][1]);
						this.context.lineTo(this.points[e][0],
								this.points[e][1]);
						this.context.stroke()
					}
				}
				this.prevMouseX = f;
				this.prevMouseY = c;
				this.count++
			},
			strokeEnd : function() {
			}
		};
		function simple(a) {
			this.init(a)
		}
		simple.prototype = {
			context : null,
			prevMouseX : null,
			prevMouseY : null,
			init : function(a) {
				this.context = a;
				this.context.globalCompositeOperation = "source-over"
			},
			destroy : function() {
			},
			strokeStart : function(b, a) {
				this.prevMouseX = b;
				this.prevMouseY = a
			},
			stroke : function(b, a) {
				this.context.lineWidth = BRUSH_SIZE;
				this.context.lineCap = "round";
				this.context.strokeStyle = "rgba(" + COLOR[0] + ", " + COLOR[1]
						+ ", " + COLOR[2] + ", " + 0.5 * BRUSH_PRESSURE + ")";
				this.context.beginPath();
				this.context.moveTo(this.prevMouseX, this.prevMouseY);
				this.context.lineTo(b, a);
				this.context.stroke();
				this.prevMouseX = b;
				this.prevMouseY = a
			},
			strokeEnd : function() {
			}
		};
		function sketchy(a) {
			this.init(a)
		}
		sketchy.prototype = {
			context : null,
			prevMouseX : null,
			prevMouseY : null,
			points : null,
			count : null,
			init : function(a) {
				this.context = a;
				this.context.globalCompositeOperation = "source-over";
				this.points = new Array();
				this.count = 0
			},
			destroy : function() {
			},
			strokeStart : function(b, a) {
				this.prevMouseX = b;
				this.prevMouseY = a
			},
			stroke : function(f, c) {
				var e, b, a, g;
        this.context.lineCap = "round";
				this.points.push([ f, c ]);
				this.context.lineWidth = BRUSH_SIZE;
				this.context.strokeStyle = "rgba(" + COLOR[0] + ", " + COLOR[1]
						+ ", " + COLOR[2] + ", " + 0.05 * BRUSH_PRESSURE + ")";
				this.context.beginPath();
				this.context.moveTo(this.prevMouseX, this.prevMouseY);
				this.context.lineTo(f, c);
				this.context.stroke();
				for (e = 0; e < this.points.length; e++) {
					b = this.points[e][0] - this.points[this.count][0];
					a = this.points[e][1] - this.points[this.count][1];
					g = b * b + a * a;
					if (g < 4000 && Math.random() > (g / 2000)) {
						this.context.beginPath();
						this.context.moveTo(this.points[this.count][0]
								+ (b * 0.3), this.points[this.count][1]
								+ (a * 0.3));
						this.context.lineTo(this.points[e][0] - (b * 0.3),
								this.points[e][1] - (a * 0.3));
						this.context.stroke()
					}
				}
				this.prevMouseX = f;
				this.prevMouseY = c;
				this.count++
			},
			strokeEnd : function() {
			}
		};
		function squares(a) {
			this.init(a)
		}
		squares.prototype = {
			context : null,
			prevMouseX : null,
			prevMouseY : null,
			init : function(a) {
				this.context = a;
				this.context.globalCompositeOperation = "source-over"
			},
			destroy : function() {
			},
			strokeStart : function(b, a) {
				this.prevMouseX = b;
				this.prevMouseY = a
			},
			stroke : function(f, d) {
				var b, a, g, e, c;
        this.context.lineCap = "round";
				b = f - this.prevMouseX;
				a = d - this.prevMouseY;
				g = 1.57079633;
				e = Math.cos(g) * b - Math.sin(g) * a;
				c = Math.sin(g) * b + Math.cos(g) * a;
				this.context.lineWidth = BRUSH_SIZE;
				this.context.fillStyle = "rgba(" + BACKGROUND_COLOR[0] + ", "
						+ BACKGROUND_COLOR[1] + ", " + BACKGROUND_COLOR[2]
						+ ", " + BRUSH_PRESSURE + ")";
				this.context.strokeStyle = "rgba(" + COLOR[0] + ", " + COLOR[1]
						+ ", " + COLOR[2] + ", " + BRUSH_PRESSURE + ")";
				this.context.beginPath();
				this.context.moveTo(this.prevMouseX - e, this.prevMouseY - c);
				this.context.lineTo(this.prevMouseX + e, this.prevMouseY + c);
				this.context.lineTo(f + e, d + c);
				this.context.lineTo(f - e, d - c);
				this.context.lineTo(this.prevMouseX - e, this.prevMouseY - c);
				this.context.fill();
				this.context.stroke();
				this.prevMouseX = f;
				this.prevMouseY = d
			},
			strokeEnd : function() {
			}
		};
		function web(a) {
			this.init(a)
		}
		web.prototype = {
			context : null,
			prevMouseX : null,
			prevMouseY : null,
			points : null,
			count : null,
			init : function(a) {
				this.context = a;
				this.context.globalCompositeOperation = "source-over";
				this.points = new Array();
				this.count = 0
			},
			destroy : function() {
			},
			strokeStart : function(b, a) {
				this.prevMouseX = b;
				this.prevMouseY = a
			},
			stroke : function(f, c) {
				var e, b, a, g;
        this.context.lineCap = "round";
				this.points.push([ f, c ]);
				this.context.lineWidth = BRUSH_SIZE;
				this.context.strokeStyle = "rgba(" + COLOR[0] + ", " + COLOR[1]
						+ ", " + COLOR[2] + ", " + 0.5 * BRUSH_PRESSURE + ")";
				this.context.beginPath();
				this.context.moveTo(this.prevMouseX, this.prevMouseY);
				this.context.lineTo(f, c);
				this.context.stroke();
				this.context.strokeStyle = "rgba(" + COLOR[0] + ", " + COLOR[1]
						+ ", " + COLOR[2] + ", " + 0.1 * BRUSH_PRESSURE + ")";
				for (e = 0; e < this.points.length; e++) {
					b = this.points[e][0] - this.points[this.count][0];
					a = this.points[e][1] - this.points[this.count][1];
					g = b * b + a * a;
					if (g < 2500 && Math.random() > 0.9) {
						this.context.beginPath();
						this.context.moveTo(this.points[this.count][0],
								this.points[this.count][1]);
						this.context.lineTo(this.points[e][0],
								this.points[e][1]);
						this.context.stroke()
					}
				}
				this.prevMouseX = f;
				this.prevMouseY = c;
				this.count++
			},
			strokeEnd : function() {
			}
		};
		function eraser(a) {
			this.init(a)
		}
		eraser.prototype = {
      context : null,
      prevMouseX : null,
      prevMouseY : null,
      init : function(a) {
        this.context = a;
        this.context.globalCompositeOperation = "destination-out";
      },
      destroy : function() {
      },
      strokeStart : function(b, a) {
        this.prevMouseX = b;
        this.prevMouseY = a
      },
      stroke : function(b, a) {
        this.context.lineCap = "round";
    	  this.context.lineWidth = BRUSH_SIZE;
        this.context.strokeStyle = "rgba(" + COLOR[0] + ", " + COLOR[1]
            + ", " + COLOR[2] + ", " + 0.5 * BRUSH_PRESSURE + ")";
        this.context.beginPath();
        this.context.moveTo(this.prevMouseX, this.prevMouseY);
        this.context.lineTo(b, a);
        this.context.stroke();
        this.prevMouseX = b;
        this.prevMouseY = a;
      },
      strokeEnd : function() {
      }
    };
		// ë¸ë¬ì¬ íì(end)
		// 
		function HSB2RGB(j, d, c) {
			var e, g, l, h, k, b, a, m;
			if (c == 0) {
				return [ 0, 0, 0 ]
			}
			j *= 0.016666667;
			d *= 0.01;
			c *= 0.01;
			h = Math.floor(j);
			k = j - h;
			b = c * (1 - d);
			a = c * (1 - (d * k));
			m = c * (1 - (d * (1 - k)));
			switch (h) {
			case 0:
				e = c;
				g = m;
				l = b;
				break;
			case 1:
				e = a;
				g = c;
				l = b;
				break;
			case 2:
				e = b;
				g = c;
				l = m;
				break;
			case 3:
				e = b;
				g = a;
				l = c;
				break;
			case 4:
				e = m;
				g = b;
				l = c;
				break;
			case 5:
				e = c;
				g = b;
				l = a;
				break
			}
			return [ e, g, l ]
		}
		function RGB2HSB(c, d, k) {
			var j, h, e, g, b, a;
			j = Math.min(Math.min(c, d), k);
			a = Math.max(Math.max(c, d), k);
			if (j == a) {
				return [ 0, 0, a * 100 ]
			}
			h = (c == j) ? d - k : ((d == j) ? k - c : c - d);
			e = (c == j) ? 3 : ((d == j) ? 5 : 1);
			g = Math.floor((e - h / (a - j)) * 60) % 360;
			b = Math.floor(((a - j) / a) * 100);
			a = Math.floor(a * 100);
			return [ g, b, a ]
		}
		function ColorSelector(a) {
			this.init(a)
		}
		ColorSelector.prototype = {
			container : null,
			color : [ 0, 0, 0 ],
			hueSelector : null,
			luminosity : null,
			luminosityData : null,
			luminositySelector : null,
			luminosityPosition : null,
			dispatcher : null,
			changeEvent : null,
			init : function(k) {
				var m = this, b, g, d;
				this.container = document.createElement("div");
				this.container.style.position = "absolute";
				
				this.container.style.width = "250px";
				this.container.style.height = "250px";
				this.container.style.visibility = "hidden";
				this.container.style.cursor = "pointer";
				this.container.addEventListener("mousedown", l, false);
				this.container.addEventListener("touchstart", f, false);
				g = document.createElement("canvas");
				g.width = k.width;
				g.height = k.height;
				b = g.getContext("2d");
				b.drawImage(k, 0, 0, g.width, g.height);
				d = b.getImageData(0, 0, g.width, g.height).data;
				this.container.appendChild(g);
				this.luminosity = document.createElement("canvas");
				this.luminosity.style.position = "absolute";
				this.luminosity.style.left = "0px";
				this.luminosity.style.top = "0px";
				this.luminosity.width = 250;
				this.luminosity.height = 250;
				this.container.appendChild(this.luminosity);
				this.hueSelector = document.createElement("canvas");
				this.hueSelector.style.position = "absolute";
				this.hueSelector.style.left = ((g.width - 15) / 2) + "px";
				this.hueSelector.style.top = ((g.height - 15) / 2) + "px";
				this.hueSelector.width = 15;
				this.hueSelector.height = 15;
				b = this.hueSelector.getContext("2d");
				b.lineWidth = 2;
				b.strokeStyle = "rgba(0, 0, 0, 0.5)";
				b.beginPath();
				b.arc(8, 8, 6, 0, Math.PI * 2, true);
				b.stroke();
				b.strokeStyle = "rgba(256, 256, 256, 0.8)";
				b.beginPath();
				b.arc(7, 7, 6, 0, Math.PI * 2, true);
				b.stroke();
				this.container.appendChild(this.hueSelector);
				this.luminosityPosition = [ (k.width - 15), (k.height - 15) / 2 ];
				this.luminositySelector = document.createElement("canvas");
				this.luminositySelector.style.position = "absolute";
				this.luminositySelector.style.left = (this.luminosityPosition[0] - 7)
						+ "px";
				this.luminositySelector.style.top = (this.luminosityPosition[1] - 7)
						+ "px";
				this.luminositySelector.width = 15;
				this.luminositySelector.height = 15;
				b = this.luminositySelector.getContext("2d");
				b.drawImage(this.hueSelector, 0, 0,
						this.luminositySelector.width,
						this.luminositySelector.height);
				this.container.appendChild(this.luminositySelector);
				this.dispatcher = document.createElement("div");
				this.changeEvent = document.createEvent("Events");
				this.changeEvent.initEvent("change", true, true);
				function l(n) {
					window.addEventListener("mousemove", c, false);
					window.addEventListener("mouseup", h, false);
					e(n.clientX - m.container.offsetLeft, n.clientY
							- m.container.offsetTop)
				}
				function c(n) {
					e(n.clientX - m.container.offsetLeft, n.clientY
							- m.container.offsetTop)
				}
				function h(n) {
					window.removeEventListener("mousemove", c, false);
					window.removeEventListener("mouseup", h, false);
					e(n.clientX - m.container.offsetLeft, n.clientY
							- m.container.offsetTop)
				}
				function f(n) {
					if (n.touches.length == 1) {
						n.preventDefault();
						window.addEventListener("touchmove", a, false);
						window.addEventListener("touchend", j, false);
						e(n.touches[0].pageX - m.container.offsetLeft,
								n.touches[0].pageY - m.container.offsetTop)
					}
				}
				function a(n) {
					if (n.touches.length == 1) {
						n.preventDefault();
						e(n.touches[0].pageX - m.container.offsetLeft,
								n.touches[0].pageY - m.container.offsetTop)
					}
				}
				function j(n) {
					if (n.touches.length == 0) {
						n.preventDefault();
						window.removeEventListener("touchmove", a, false);
						window.removeEventListener("touchend", j, false)
					}
				}
				function e(o, t) {
					var q, p, r, n, s;
					q = o - 125;
					p = t - 125;
					r = Math.sqrt(q * q + p * p);
					if (r < 90) {
						m.hueSelector.style.left = (o - 7) + "px";
						m.hueSelector.style.top = (t - 7) + "px";
						m.updateLuminosity([ d[(o + (t * 250)) * 4],
								d[(o + (t * 250)) * 4 + 1],
								d[(o + (t * 250)) * 4 + 2] ])
					} else {
						if (r > 100) {
							n = q / r;
							s = p / r;
							m.luminosityPosition[0] = (n * 110) + 125;
							m.luminosityPosition[1] = (s * 110) + 125;
							m.luminositySelector.style.left = (m.luminosityPosition[0] - 7)
									+ "px";
							m.luminositySelector.style.top = (m.luminosityPosition[1] - 7)
									+ "px"
						}
					}
					o = Math.floor(m.luminosityPosition[0]);
					t = Math.floor(m.luminosityPosition[1]);
					m.color[0] = m.luminosityData[(o + (t * 250)) * 4];
					m.color[1] = m.luminosityData[(o + (t * 250)) * 4 + 1];
					m.color[2] = m.luminosityData[(o + (t * 250)) * 4 + 2];
					m.dispatchEvent(m.changeEvent)
				}
			},
			show : function() {
				this.container.style.visibility = "visible"
			},
			hide : function() {
				this.container.style.visibility = "hidden"
			},
			getColor : function() {
				return this.color
			},
			setColor : function(c) {
				var a, e, f, d, b = Math.PI / 180;
				this.color = c;
				a = RGB2HSB(c[0] / 255, c[1] / 255, c[2] / 255);
				e = a[0] * b;
				f = (a[1] / 100) * 90;
				this.hueSelector.style.left = ((Math.cos(e) * f + 125) - 7)
						+ "px";
				this.hueSelector.style.top = ((Math.sin(e) * f + 125) - 7)
						+ "px";
				d = HSB2RGB(a[0], a[1], 100);
				d[0] *= 255;
				d[1] *= 255;
				d[2] *= 255;
				this.updateLuminosity(d);
				e = (a[2] / 100) * 360 * b;
				this.luminosityPosition[0] = (Math.cos(e) * 110) + 125;
				this.luminosityPosition[1] = (Math.sin(e) * 110) + 125;
				this.luminositySelector.style.left = (this.luminosityPosition[0] - 7)
						+ "px";
				this.luminositySelector.style.top = (this.luminosityPosition[1] - 7)
						+ "px";
				this.dispatchEvent(this.changeEvent)
			},
			updateLuminosity : function(j) {
				var d, f, l, g, p, b, a, o = 100, h = 120, k, n = 1080 / 2, e = 1 / n, c = Math.PI / 180, m = (n / 360);
				b = this.luminosity.width / 2;
				a = this.luminosity.height / 2;
				d = this.luminosity.getContext("2d");
				d.lineWidth = 3;
				d
						.clearRect(0, 0, this.luminosity.width,
								this.luminosity.height);
				for (k = 0; k < n; k++) {
					f = k / m * c;
					l = Math.cos(f);
					g = Math.sin(f);
					p = 255 - (k * e) * 255;
					d.strokeStyle = "rgb(" + Math.floor(j[0] - p) + ","
							+ Math.floor(j[1] - p) + "," + Math.floor(j[2] - p)
							+ ")";
					d.beginPath();
					d.moveTo(l * o + b, g * o + a);
					d.lineTo(l * h + b, g * h + a);
					d.stroke()
				}
				this.luminosityData = d.getImageData(0, 0,
						this.luminosity.width, this.luminosity.height).data
			},
			addEventListener : function(b, c, a) {
				this.dispatcher.addEventListener(b, c, a)
			},
			dispatchEvent : function(a) {
				this.dispatcher.dispatchEvent(a)
			},
			removeEventListener : function(b, c, a) {
				this.dispatcher.removeEventListener(b, c, a)
			}
		};
		// ìºë²ì¤아이씨
		function Palette() {
			var e, d, b, a, n = 90, m = 1080, f = 1 / m, l = m / 360, c = Math.PI / 180, j, h, k, g, o;
			e = document.createElement("canvas");
			e.width = 250;
			e.height = 250;
			b = e.width / 2;
			a = e.height / 2;
			d = e.getContext("2d");
			d.lineWidth = 1;
			for (j = 0; j < m; j++) {
				h = j / l * c;
				k = Math.cos(h);
				g = Math.sin(h);
				d.strokeStyle = "hsl(" + Math.floor((j * f) * 360)
						+ ", 100%, 50%)";
				d.beginPath();
				d.moveTo(k + b, g + a);
				d.lineTo(k * n + b, g * n + a);
				d.stroke()
			}
			o = d.createRadialGradient(b, b, 0, b, b, n);
			o.addColorStop(0, "rgba(255, 255, 255, 1)");
			o.addColorStop(1, "rgba(255, 255, 255, 0)");
			d.fillStyle = o;
			d.fillRect(0, 0, e.width, e.height);
			return e
		}
		
		function MenuController() {
			this.init()
		}
		MenuController.prototype = {
	      fold : null,
	      unfold : null,
				init : function() {
	        var c;
	        
	        this.fold = document.createElement("button");
	        this.fold.className = "btn btn-default";
          this.fold.style.position = "absolute";
          this.fold.style.top = "3px";
          this.fold.style.height = "25px";
          this.fold.style.padding = "2px";
          this.fold.style.width = "48px";
	        c = document.createTextNode("FOLD");
	        this.fold.appendChild(c);
	        
	        this.unfold = document.createElement("button");
          this.unfold.className = "btn btn-default";
          this.unfold.style.position = "absolute";
          this.unfold.style.top = "3px";
          this.unfold.style.height = "25px";
          this.unfold.style.padding = "2px";
          this.unfold.style.visibility = "hidden"
          c = document.createTextNode("UNFOLD");
          this.unfold.appendChild(c);
				},
	      fShow : function() {
          this.fold.style.visibility = "visible"
        },
        fHide : function() {
          this.fold.style.visibility = "hidden"
        },
        uShow : function() {
          this.unfold.style.visibility = "visible"
        },
        uHide : function() {
          this.unfold.style.visibility = "hidden"
        }
		};
		/*ì ë°ì  ë©ë´ ì½ì*/
		function Menu() {
			this.init()
		}
		Menu.prototype = {
			container : null,
			subContainer1 : null,
			//subContainer2 : null,
			foregroundColor : null,
			eraser : null,
			sizeSelector : null,
			selector : null,
			save : null,
			clear : null,
			about : null,
			saveSpan : null,
			clearSpan : null,
			aboutSpan : null,
			saveIcon : null,
		  clearIcon : null,
		  aboutIcon : null,
		  saveForm : null,
		  formImg : null,
			init : function() {
				var b, c, d, e = 20, a = 20;
				// <div class="gui" style="position:absolute; top:0px; width:375px"> (container)
				// 
				
				this.container = document.createElement("div");
				this.container.className = "gui container";
				this.container.style.position = "absolute";
				this.container.style.top = "0px";
				this.container.style.width = "375px";
        this.container.style.visibility = "visible";
				
				this.subContainer1 = document.createElement("div");
				this.subContainer1.className = "wrapper";
				this.container.appendChild(this.subContainer1);
				
				this.foregroundColor = document.createElement("canvas");
				this.foregroundColor.style.position = "relative";
				this.foregroundColor.style.top = "1px";
				this.foregroundColor.style.cursor = "pointer";
				this.foregroundColor.width = e;
				this.foregroundColor.height = a;
				this.subContainer1.appendChild(this.foregroundColor);
				this.setForegroundColor(COLOR);
				
				c = document.createTextNode(" ");
				this.subContainer1.appendChild(c);
				c = document.createTextNode(" ");
				this.subContainer1.appendChild(c);
				
				this.eraser = document.createElement("i");
				this.eraser.className = "glyphicon glyphicon-erase";
				this.eraser.style.fontSize = "20px";
				this.subContainer1.appendChild(this.eraser);
				
				this.sizeSelector = document.createElement("select");
				this.sizeSelector.style.width = "50%";
				this.sizeSelector.style.margin = "0px";
				this.sizeSelector.id = "sizeSelector";
				this.sizeSelector.className = "form-control";
				for (i = 0; i < SIZE_OPTION; i++) {
          b = document.createElement("option");
          b.id = i;
          b.innerHTML = (i + 1) * 5;
          this.sizeSelector.appendChild(b)
        }
				this.container.appendChild(this.sizeSelector);
				
				this.selector = document.createElement("select");
				this.selector.style.width = "50%";
				this.selector.style.margin = "0px";
				this.selector.id = "brushSeletor";
				this.selector.className = "form-control";
				for (i = 0; i < BRUSHES.length; i++) {
					b = document.createElement("option");
					b.id = i;
					b.innerHTML = BRUSHES[i].toUpperCase();
					this.selector.appendChild(b)
				}
				this.container.appendChild(this.selector);
		    //ìë² ë²
		    
        this.saveForm = document.createElement("form");
        this.saveForm.action = "./member/injung.do";
        this.saveForm.method = "post";
        this.saveForm.id = "form1";
        this.saveForm.name = "form1";
        this.saveForm.enctype = "multipart/form-data";
        this.container.appendChild(this.saveForm);
        
        this.formImg = document.createElement("input");
        this.formImg.name = "hidden";
        this.formImg.id = "hidden";
        this.formImg.type = "hidden";
        this.saveForm.appendChild(this.formImg);
				
				this.save = document.createElement("button");
				this.save.className = "btn btn-labeled btn-success";
				this.save.style.fontFamily = "Georgia";
				this.save.style.color = "black";
				this.save.type = "button";
				
        this.saveForm.appendChild(this.save);
        //this.container.appendChild(this.save);
				
				//<form class="form-horizontal" action="member/modify.do"
        //method="post" enctype="multipart/form-data"
        //onsubmit="return info_check();">
				
				//var writer = "<c:out value="${writer}"/>";
				//alert("${loginInfo.nickName}");
				
				
				this.saveSpan = document.createElement("span");
		    this.saveSpan.className = "btn-label";
		    this.save.appendChild(this.saveSpan);
				
		    this.saveIcon = document.createElement("i");
		    this.saveIcon.className = "glyphicon glyphicon-save-file";
		    this.saveSpan.appendChild(this.saveIcon);
		    
		    c = document.createTextNode("SAVE");
		    this.save.appendChild(c);
		    
				c = document.createTextNode(" | ");
				this.saveForm.appendChild(c);
				//this.container.appendChild(c);
				
				/////////////////////////////////////////////////////////////

				this.clear = document.createElement("button");
        this.clear.className = "btn btn-labeled btn-warning";
        this.clear.style.fontFamily="Georgia";
        this.clear.style.color="black";
        this.clear.type = "button";
        this.saveForm.appendChild(this.clear);
        //this.container.appendChild(this.clear);
        
        this.clearSpan = document.createElement("span");
        this.clearSpan.className = "btn-label";
        this.clear.appendChild(this.clearSpan);
        
        this.clearIcon = document.createElement("i");
        this.clearIcon.className = "glyphicon glyphicon-trash";
        this.clearSpan.appendChild(this.clearIcon);
        
        c = document.createTextNode("CLEAR");
        this.clear.appendChild(c);
        
        c = document.createTextNode(" | ");
        /*
        this.saveForm.appendChild(c);
        */
        //this.container.appendChild(c);
				
				/////////////////////////////////////////////////////////////
				
				this.about = document.createElement("button");
        this.about.className = "btn btn-labeled btn-default";
        this.about.style.fontFamily="Georgia";
        this.about.style.color="black";
        this.about.type = "button";
        /*
        this.saveForm.appendChild(this.about);
        //this.container.appendChild(this.about);
        
        this.aboutSpan = document.createElement("span");
        this.aboutSpan.className = "btn-label";
        this.about.appendChild(this.aboutSpan);
        
        this.aboutIcon = document.createElement("i");
        this.aboutIcon.className = "glyphicon glyphicon-info-sign";
        this.aboutSpan.appendChild(this.aboutIcon);
        
        c = document.createTextNode("about");
        this.about.appendChild(c);
         */
			},
			setForegroundColor : function(a) {
				var b = this.foregroundColor.getContext("2d");
				b.fillStyle = "rgb(" + a[0] + ", " + a[1] + ", " + a[2] + ")";
				b.fillRect(0, 0, this.foregroundColor.width,
						this.foregroundColor.height);
				b.fillStyle = "rgba(0, 0, 0, 0.1)";
				b.fillRect(0, 0, this.foregroundColor.width, 1)
			},
      show : function() {
        this.container.style.visibility = "visible"
      },
      hide : function() {
        this.container.style.visibility = "hidden"
      }
		};
		function About() {
			this.init()
		}
		About.prototype = {
			container : null,
			init : function() {
				var b, a;
				this.container = document.createElement("div");
				this.container.className = "gui";
				this.container.style.position = "absolute";
				this.container.style.top = "0px";
				this.container.style.visibility = "hidden";
				a = document.createElement("div");
				a.style.margin = "10px 10px";
				a.style.textAlign = "left";
				this.container.appendChild(a);
				b = document.createElement("p");
				b.style.textAlign = "center";
				b.innerHTML = 'Brush: <span class="key">d</span><span class="key">f</span> size, <span class="key">r</span> reset<br />Color: <span class="key">shift</span> wheel, <span class="key">alt</span> picker<br />';
				a.appendChild(b);
				b = document.createElement("hr");
				a.appendChild(b);
				
			},
			show : function() {
				this.container.style.visibility = "visible"
			},
			hide : function() {
				this.container.style.visibility = "hidden"
			}
		};
		const
		REV = 6,
				BRUSHES = [ "sketchy", "shaded", "chrome", "fur", "longfur",
						"web", "", "simple", "squares", "ribbon", "",
						"circles", "grid", "eraser" ], USER_AGENT = navigator.userAgent
						.toLowerCase(), SIZE_OPTION = 10;
		var SCREEN_WIDTH =$(document).width(), SCREEN_HEIGHT = $(document).height(), BRUSH_SIZE = 1, BRUSH_PRESSURE = 1, COLOR = [
				0, 0, 0 ], imageObj, urlVars, imgTag, BACKGROUND_COLOR = [ 250, 250, 250 ], STORAGE = window.localStorage, brush, saveTimeOut, wacom, i, mouseX = 0, mouseY = 0, container, foregroundColorSelector, menu, about, canvas, imageCanvas, flattenCanvas, context, menuController, isFgColorSelectorVisible = false, isBgColorSelectorVisible = false, isAboutVisible = false, isMenuMouseOver = false, shiftKeyIsDown = false, altKeyIsDown = false, isMenuVisible = true, isOnFold = false;
		init();
		function init() {
			var getdata;
      var urlHalves = String(document.location).split('?');
      if(urlHalves[1]){      
          urlVars = urlHalves[1].split('&');      
          var urlVarPair = urlVars[0].split('=');            
          getdata = urlVarPair[1];
      }
			// ë©ì¸ ìì±
			// íë¡í íì ì»¨íì´ëë¤ì ì§ì  ìì±íì¬ ë¶ì´ë ê³³
			var hash, palette, embed, localStorageImage, tmpCon;
			if (USER_AGENT.search("android") > -1
					|| USER_AGENT.search("iphone") > -1) {
				BRUSH_SIZE = 2
			}
			if (USER_AGENT.search("safari") > -1
					&& USER_AGENT.search("chrome") == -1) {
				STORAGE = false
			}
			imageObj = new Image();
      //imageObj.src = "./files/<?=htmlspecialchars($_GET['paint'])?>";
			
			container = document.createElement("div");
			document.body.appendChild(container);
			
			imgTag = document.createElement("img");
		  imgTag.style.position = "absolute";
		  imgTag.style.top = "100px";
			imgTag.src = "./files/" + getdata;
		  imgTag.style.left = (SCREEN_WIDTH / 2) - imgTag.width / 2 + "px";
			imgTag.style.position = "absolute";
			container.appendChild(imgTag);
			
			
			//imageCanvas = document.createElement("canvas");
      //imageCanvas.width = 200;
      //imageCanvas.height = 200;
      //tmpCon = imageCanvas.getContext("2d");
      //container.appendChild(imageCanvas);
			
			canvas = document.createElement("canvas");
			canvas.width = $(document).width();
			canvas.height = $(document).height();
			canvas.style.position = "absolute";
			canvas.style.cursor = "crosshair";
			container.appendChild(canvas);
			context = canvas.getContext("2d");
			
			
      // ì´ë ê² í¨ìì ë´ìì¼ ì²ì ííì´ì§ì ì ê·¼í´ë ì ì ì¶ë ¥ë¨
      /*imageObj.onload = function() {
        context.drawImage(imageObj, 69, 50);
      };*/
			
			flattenCanvas = document.createElement("canvas");
			flattenCanvas.width = imgTag.width;
			flattenCanvas.height = imgTag.height;
			flattenCanvas.id = "canvas";
			
			palette = new Palette();
			foregroundColorSelector = new ColorSelector(palette);
			foregroundColorSelector.addEventListener("change",
					onForegroundColorSelectorChange, false);
			container.appendChild(foregroundColorSelector.container);
			
			menu = new Menu();
      menu.eraser.addEventListener("click", onEraser, false);
      menu.eraser.addEventListener("touchend", onEraser, false);
			menu.foregroundColor.addEventListener("click",
					onMenuForegroundColor, false);
			menu.foregroundColor.addEventListener("touchend",
					onMenuForegroundColor, false);
			menu.selector.addEventListener("change", onMenuSelectorChange,
					false);
			menu.sizeSelector.addEventListener("change", onSizeSelectorChange,
			          false);
			menu.save.addEventListener("click", onMenuSave, false);
			menu.save.addEventListener("touchend", onMenuSave, false);
			menu.clear.addEventListener("click", onMenuClear, false);
			menu.clear.addEventListener("touchend", onMenuClear, false);
			menu.about.addEventListener("click", onMenuAbout, false);
			menu.about.addEventListener("touchend", onMenuAbout, false);
			menu.container
					.addEventListener("mouseover", onMenuMouseOver, false);
			menu.container.addEventListener("mouseout", onMenuMouseOut, false);
			container.appendChild(menu.container);
			
			menuController = new MenuController();
			container.appendChild(menuController.fold);
			container.appendChild(menuController.unfold);
			
			menuController.fold.addEventListener("click", onFold, false);
			menuController.fold.addEventListener("touchend", onFold, false);
			menuController.unfold.addEventListener("click", onUnfold, false);
      menuController.unfold.addEventListener("touchend", onUnfold, false);
			//menuController.
			
			if (STORAGE) {
				if (localStorage.canvas) {
					localStorageImage = new Image();
					/*
					localStorageImage.addEventListener("load", function(event) {
						localStorageImage.removeEventListener(event.type,
								arguments.callee, false);
						context.drawImage(localStorageImage, 0, 0)
					}, false);
          */
					localStorageImage.src = localStorage.canvas
				}
				if (localStorage.brush_color_red) {
					COLOR[0] = localStorage.brush_color_red;
					COLOR[1] = localStorage.brush_color_green;
					COLOR[2] = localStorage.brush_color_blue
				}
				if (localStorage.background_color_red) {
					BACKGROUND_COLOR[0] = localStorage.background_color_red;
					BACKGROUND_COLOR[1] = localStorage.background_color_green;
					BACKGROUND_COLOR[2] = localStorage.background_color_blue
				}
			}
			foregroundColorSelector.setColor(COLOR);
			if (window.location.hash) {
				hash = window.location.hash.split("#");
				for (i = 0; i < BRUSHES.length; i++) {
					if (hash[1] == BRUSHES[i]) {
						brush = eval("new " + BRUSHES[i] + "(context)");
						menu.selector.selectedIndex = i;
						break
					}
				}
				(Number(menu.sizeSelector.selectedIndex) + 1) * 5
				for (i = 0; i < SIZE_OPTION; i++) {
				  if (hash[2] == $("#sizeSelector option:eq("+ i +")").val()) {
			          //alert($("#sizeSelector option:eq("+ i +")").val());
            BRUSH_SIZE = hash[2];
            menu.sizeSelector.selectedIndex = i;
            break
          }
        }
			}
			if (!brush) {
				brush = eval("new " + BRUSHES[0] + "(context)")
			}
			about = new About();
			container.appendChild(about.container);
			window.addEventListener("mousemove", onWindowMouseMove, false);
			window.addEventListener("resize", onWindowResize, false);
			window.addEventListener("keydown", onWindowKeyDown, false);
			window.addEventListener("keyup", onWindowKeyUp, false);
			window.addEventListener("blur", onWindowBlur, false);
			document.addEventListener("mousedown", onDocumentMouseDown, false);
			document.addEventListener("mouseout", onDocumentMouseOut, false);
			canvas.addEventListener("mousedown", onCanvasMouseDown, false);
			canvas.addEventListener("touchstart", onCanvasTouchStart, false);
			onWindowResize(null)
		}
		// ì´ë²¤í¸ ë¦¬ì¤ë
		function onWindowMouseMove(a) {
			mouseX = a.clientX;
			mouseY = a.clientY
		}
		function onWindowResize() {
			SCREEN_WIDTH = $(document).width();
			SCREEN_HEIGHT = $(document).height();
			menu.container.style.left = ((window.innerWidth - menu.container.offsetWidth) / 2)
					+ "px";
			menuController.fold.style.left = ((window.innerWidth - menuController.fold.offsetWidth) / 2 + 145)
	          + "px";
			menuController.unfold.style.left = ((window.innerWidth - menuController.fold.offsetWidth) / 2 + 145)
            + "px";
			about.container.style.left = ((window.innerWidth - about.container.offsetWidth) / 2)
					+ "px";
			about.container.style.top = ((window.innerHeight - about.container.offsetHeight) / 2)
					+ "px";
		}
		function onWindowKeyDown(a) {
			if (shiftKeyIsDown) {
				return
			}
			switch (a.keyCode) {
			case 16: // Shift
				shiftKeyIsDown = true;
				foregroundColorSelector.container.style.left = mouseX - 125
						+ "px";
				foregroundColorSelector.container.style.top = mouseY - 125
						+ "px";
				foregroundColorSelector.container.style.visibility = "visible";
				break;
			case 18: // Alt
				altKeyIsDown = true;
				break;
			case 68: // "D"
				if (BRUSH_SIZE > 1) {
					BRUSH_SIZE--
				}
				break;
			case 70: // "F"
				BRUSH_SIZE++;
				break
			}
		}
		function onWindowKeyUp(event) {
			switch (event.keyCode) {
			case 16: // Shift
				shiftKeyIsDown = false;
				foregroundColorSelector.container.style.visibility = "hidden";
				break;
			case 18: // Alt
				altKeyIsDown = false;
				break;
			case 82: // R
				brush.destroy();
				brush = eval("new " + BRUSHES[menu.selector.selectedIndex]
						+ "(context)");
				break
			}
			context.lineCap = BRUSH_SIZE == 1 ? "butt" : "round";
		}
		function onWindowBlur(a) {
			shiftKeyIsDown = false;
			altKeyIsDown = false
		}
		function onDocumentMouseDown(a) {
			if (!isMenuMouseOver) {
				a.preventDefault()
			}
		}
		function onDocumentMouseOut(a) {
			onCanvasMouseUp()
		}
		function onForegroundColorSelectorChange(a) {
			COLOR = foregroundColorSelector.getColor();
			menu.setForegroundColor(COLOR);
			if (STORAGE) {
				localStorage.brush_color_red = COLOR[0];
				localStorage.brush_color_green = COLOR[1];
				localStorage.brush_color_blue = COLOR[2]
			}
		}
		
		function onEraser() {
			// ì§ì°ê°
      cleanPopUps();
      brush.destroy();
      brush = eval("new " + BRUSHES[13]
          + "(context)");
      window.location.hash = BRUSHES[13] + "#" + ((Number(menu.sizeSelector.selectedIndex) + 1) * 5);
      $("#brushSeletor option:eq(13)").attr("selected", "selected");
    }
		
		function onMenuForegroundColor() {
			cleanPopUps();
			foregroundColorSelector.show();
			foregroundColorSelector.container.style.left = ((SCREEN_WIDTH - foregroundColorSelector.container.offsetWidth) / 2)
					+ "px";
			foregroundColorSelector.container.style.top = ((SCREEN_HEIGHT - foregroundColorSelector.container.offsetHeight) / 2)
					+ "px";
			isFgColorSelectorVisible = true
		}

		function onMenuSelectorChange() {
			// ë¸ë¬ì¬
			if (BRUSHES[menu.selector.selectedIndex] == "") {
				return
			}
			brush.destroy();
			brush = eval("new " + BRUSHES[menu.selector.selectedIndex]
					+ "(context)");
			window.location.hash = BRUSHES[menu.selector.selectedIndex] + "#" + ((Number(menu.sizeSelector.selectedIndex) + 1) * 5);
		}
		function onSizeSelectorChange() {
			BRUSH_SIZE = (Number(menu.sizeSelector.selectedIndex) + 1) * 5;
			window.location.hash = BRUSHES[menu.selector.selectedIndex] + "#" + ((Number(menu.sizeSelector.selectedIndex) + 1) * 5);
    }
		function onMenuMouseOver() {
			isMenuMouseOver = true
		}
		function onMenuMouseOut() {
			isMenuMouseOver = false
		}
		function onMenuSave() {
			flatten();
			$("#hidden").val(flattenCanvas.toDataURL("image/png"));
			
	    $("#form1").submit();
		}
		function onFold() {
			cleanPopUps();
			isOnFold = true;
      isMenuVisible = false;
			menuController.fHide();
			menuController.uShow();
			menu.hide();
		}
		function onUnfold() {
			cleanPopUps();
      isOnFold = false;
      isMenuVisible = true;
      menuController.uHide();
      menuController.fShow();
      menu.show();
		}
		function onMenuClear() {
			if (!confirm("Are you sure?")) {
				return
			}
			context.clearRect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
			//alert(SCREEN_WIDTH);
			saveToLocalStorage();
			brush.destroy();
			brush = eval("new " + BRUSHES[menu.selector.selectedIndex]
					+ "(context)")
		}
		function onMenuAbout() {
			cleanPopUps();
			isAboutVisible = true;
			about.show()
		}
		function onCanvasMouseDown(b) {
			var c, a;
			clearTimeout(saveTimeOut);
			cleanPopUps();
			
			if (altKeyIsDown) {
				flatten();
				c = flattenCanvas.getContext("2d").getImageData(0, 0,
						flattenCanvas.width, flattenCanvas.height).data;
				a = (b.clientX + (b.clientY * canvas.width)) * 4;
				foregroundColorSelector.setColor([ c[a], c[a + 1], c[a + 2] ]);
				return
			}
			BRUSH_PRESSURE = wacom && wacom.isWacom ? wacom.pressure : 1;
			brush.strokeStart(b.clientX, b.clientY);
			
			window.addEventListener("mousemove", onCanvasMouseMove, false);
			window.addEventListener("mouseup", onCanvasMouseUp, false)
		}
		function onCanvasMouseMove(a) {
			BRUSH_PRESSURE = wacom && wacom.isWacom ? wacom.pressure : 1;
			brush.stroke(a.clientX, a.clientY);
		}
		function onCanvasMouseUp() {
			brush.strokeEnd();
			window.removeEventListener("mousemove", onCanvasMouseMove, false);
			window.removeEventListener("mouseup", onCanvasMouseUp, false);
			if (STORAGE) {
				clearTimeout(saveTimeOut);
				saveTimeOut = setTimeout(saveToLocalStorage, 2000, true)
			}
		}
		function onCanvasTouchStart(a) {
			cleanPopUps();
			if (a.touches.length == 1) {
				a.preventDefault();
				brush.strokeStart(a.touches[0].pageX, a.touches[0].pageY);
				window.addEventListener("touchmove", onCanvasTouchMove, false);
				window.addEventListener("touchend", onCanvasTouchEnd, false)
			}
		}
		function onCanvasTouchMove(a) {
			if (a.touches.length == 1) {
				a.preventDefault();
				brush.stroke(a.touches[0].pageX, a.touches[0].pageY);
			}
		}
		function onCanvasTouchEnd(a) {
			if (a.touches.length == 0) {
				a.preventDefault();
				brush.strokeEnd();
				window.removeEventListener("touchmove", onCanvasTouchMove,
						false);
				window.removeEventListener("touchend", onCanvasTouchEnd, false)
			}
		}
		function saveToLocalStorage() {
			localStorage.canvas = canvas.toDataURL("image/png")
		}
		// ë³µì¬ë³¸ ë§ë¤ì´ì ë³´ë´ê¸°
		function flatten() {
			var a = flattenCanvas.getContext("2d");
			a.fillStyle = "rgb(" + BACKGROUND_COLOR[0] + ", "
					+ BACKGROUND_COLOR[1] + ", " + BACKGROUND_COLOR[2] + ")";
			a.drawImage(imgTag, 0, 0, imgTag.width, imgTag.height);
			//a.drawImage(canvas,90,130,50,60,10,10,50,60);
			a.drawImage(canvas, (SCREEN_WIDTH / 2) - imgTag.width / 2, 100, imgTag.width, imgTag.height, 0, 0, imgTag.width, imgTag.height);
			//imgTag.left, 100, imgTag.width, imgTag.height,
		}
		function cleanPopUps() {
			if (isFgColorSelectorVisible) {
				foregroundColorSelector.hide();
				isFgColorSelectorVisible = false
			}
			if (isAboutVisible) {
				about.hide();
				isAboutVisible = false
			}
		};
	</script>

	<!--  -->
</body>
</html>