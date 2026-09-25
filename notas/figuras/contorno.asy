if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed= true;
settings.toolbar=false;
viewportmargin=(2,2);

defaultfilename=outprefix();

size(5cm);

pen[] gridline_pens = {rgb("#adadad") + 0.5pt, rgb("#ee8383") + 0.5pt};
pen[] axes_pens = {rgb("#000000") + 1pt, rgb("#9e1818") + 1pt};
pair ori = (0, 0);

// points 
real[][] rs = {{1, 1}, {2, 3}};
// original vectors
pair[] eCs = {(1, 0), (0, 1)};
// new vectors (v = 0.5)
pair[] eGs = {(1, 0), (0.5, 1)};

// gridlines
int n = 5;
for (int j=-n; j<n; ++j){
    // original system
    draw((-n*eCs[0] + j*eCs[1])--(n*eCs[0]+j*eCs[1]), gridline_pens[0]);
    draw((-n*eCs[1] + j*eCs[0])--(n*eCs[1]+j*eCs[0]), gridline_pens[0]);

}


draw((-3,0)--(3, 0), axes_pens[0], Arrow(6bp));
draw(arc(ori, 3, 0, 180), axes_pens[0], Arrow(6bp));


pair[] poles = {(1.5,+0.15), (-1.5,-0.15)};
string[] labels = {"$\omega/c+i\varepsilon$", "$-\omega/c-i\varepsilon$"};
pair[] positions = {N, S};
for (int i=0; i<=1; ++i){
    dot(poles[i]);
    label(labels[i], poles[i], positions[i]);
}
dot(ori);

// clip to smaller frame
path frame = box((-3.1, -1.1), (3.1, 3.1));
clip(currentpicture, frame);
