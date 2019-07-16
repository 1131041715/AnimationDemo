//
//  Circle.m
//  CLNetWorking
//
//  Created by hezhijingwei on 16/7/5.
//  Copyright © 2016年 秦传龙. All rights reserved.
//

#import "CLCircle.h"

@interface CLCircle ()

@property (nonatomic ,strong) UIBezierPath *bezierPath;

@property (nonatomic ,strong) CAShapeLayer *shapeLayer;


@end


@implementation CLCircle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.style = CLCircleStyleDefault;
        self.lineWidth = 35.0f;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {

    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:self.center radius:(self.frame.size.width - 100.5)/2 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    [self adjust:path];
    [path stroke];
    
    for (int i = 0; i <= self.StartPointList.count - 2; i++) {
        
    
    _bezierPath = [UIBezierPath bezierPath];
    [_bezierPath addArcWithCenter:self.center radius:(self.frame.size.width - 100)/2 startAngle:[self.StartPointList[i] floatValue] endAngle:[self.StartPointList[i + 1] floatValue] clockwise:YES];
        
        _shapeLayer = [CAShapeLayer layer];
        _shapeLayer.frame = self.frame;
        _shapeLayer.position = self.center;
        _shapeLayer.path = _bezierPath.CGPath;
        [self adjustPathAndShapeLayer:_bezierPath shaperLayer:_shapeLayer color:((UIColor *)self.colorList[i])];
        [self.layer addSublayer:_shapeLayer];
    }
}

- (void)adjustPathAndShapeLayer:(UIBezierPath *)bezierPath shaperLayer:(CAShapeLayer *)shaperLayer color:(UIColor *)color {
    
    
    
    switch (self.style) {
        case CLCircleStyleFill:{
            
            [bezierPath addLineToPoint:self.center];
            [bezierPath closePath];
            [color setFill];
            [bezierPath fill];
            
            shaperLayer.fillColor = color.CGColor;
            
            
        }
            
            break;
        case CLCircleStyleDefault:
        {
            
            bezierPath.lineWidth = self.lineWidth;
            shaperLayer.lineCap = @"round";
            shaperLayer.fillColor = [UIColor clearColor].CGColor;
            shaperLayer.lineWidth = self.lineWidth;
            shaperLayer.strokeColor = color.CGColor;
            
        }
            break;
            
        default:
            break;
    }

}


- (void)adjust:(UIBezierPath *)path {
    
     UIColor *color = self.colorList[self.colorList.count - 1];
    switch (self.style) {
        case CLCircleStyleFill:{
            
            [path addLineToPoint:self.center];
            [path closePath];
            [color setFill];
            [path fill];
            
        }
            
            break;
        case CLCircleStyleDefault:
        {
            path.lineWidth = self.lineWidth;
            [color setStroke];
        }
            break;
            
        default:
            break;
    }
    
    
}


@end
